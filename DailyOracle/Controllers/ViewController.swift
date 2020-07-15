//
//  ViewController.swift
//  DailyOracle
//
//  Created by Theodora on 7/15/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIScrollViewDelegate, ZodiacDelegate {
    
    @IBOutlet var images: [UIImageView]!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var zodiacManager = ZodiacManager()
    private var mainText: String = ""
    private var mood: String = ""
    private var color: String = ""
    private var luckyNumber: String = ""
    private var luckyTime: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        zodiacManager.delegate = self
        PlayerService.playSong(song: "mainMenu")
        
        for image in images {
            image.layer.shadowOffset = CGSize(width: 5, height: 5)
            image.layer.shadowOpacity = 0.5
            image.layer.shadowRadius = 5
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
    
    func didUpdate(horoscope: ZodiacModel) {  //delegate method
        
        mainText = horoscope.description
        mood = horoscope.mood
        color = horoscope.color
        luckyNumber = horoscope.luckyNumber
        luckyTime = horoscope.luckyTime
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailViewController
        
        func updateElements(sign: String) {
            zodiacManager.fetchZodiac(name: sign)
            
            destinationVC.signImage = UIImage(named: sign)
            destinationVC.signText = mainText
            destinationVC.signMood = mood
            destinationVC.signColor = color
            destinationVC.signLuckyNumber = luckyNumber
            destinationVC.signLuckyTime = luckyTime
        }
        
        switch segue.identifier {
        case "1":
            updateElements(sign: "aquarius")
        case "2":
            updateElements(sign: "aries")
            
        case "3":
            updateElements(sign: "cancer")
            
        case "4":
            updateElements(sign: "capricorn")
            
        case "5":
            updateElements(sign: "gemini")
            
        case "6":
            updateElements(sign: "leo")
            
        case "7":
            updateElements(sign: "libra")
            
        case "8":
            updateElements(sign: "pisces")
            
        case "9":
            updateElements(sign: "sagittarius")
            
        case "10":
            updateElements(sign: "scorpio")
            
        case "11":
            updateElements(sign: "taurus")
            
        case "12":
            updateElements(sign: "virgo")
        default: break
        }
        //PlayerService.playSong(song: "nextPage")
    }
    
}

