//
//  ZodiacModel.swift
//  DailyOracle
//
//  Created by Theodora on 7/15/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import Foundation

protocol ZodiacDelegate {
    func didUpdate(horoscope: ZodiacModel)
}

struct ZodiacManager {
    
    var delegate: ZodiacDelegate?
    
    private let headers = [
        "x-rapidapi-host": "sameer-kumar-aztro-v1.p.rapidapi.com",
        "x-rapidapi-key": "73ec6c3d2cmsh957c31287155f47p18eee8jsn40843ea3167b",
        "content-type": "application/x-www-form-urlencoded"
    ]
    
    func fetchZodiac(name: String) {
        let semaphore = DispatchSemaphore(value: 0)
        let url = "https://sameer-kumar-aztro-v1.p.rapidapi.com/?sign=\(name)&day=today"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                if let responseData = data {
                    if let response = self.parseJSON(zodiacData: responseData) {
                        
                        self.delegate?.didUpdate(horoscope: response)
                    }
                }
            }
            semaphore.signal()
        })
        dataTask.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    }
    
    func parseJSON(zodiacData: Data) -> ZodiacModel?  {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(ZodiacData.self, from: zodiacData)
            let description = decodedData.description
            let mood = decodedData.mood
            let color = decodedData.color
            let lucky_number = decodedData.lucky_number
            let lucky_time = decodedData.lucky_time
            
            let horoscope = ZodiacModel(description: description, mood: mood, color: color, luckyNumber: lucky_number, luckyTime: lucky_time)
            return horoscope
        } catch {
            print(error)
        }
        return nil
    }
}

