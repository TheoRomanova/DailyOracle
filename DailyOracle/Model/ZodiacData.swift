//
//  ZodiacData.swift
//  DailyOracle
//
//  Created by Theodora on 7/15/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import Foundation

struct ZodiacData: Decodable {
    
    let description: String
    let mood: String
    let color: String
    let lucky_number: String
    let lucky_time: String
}
