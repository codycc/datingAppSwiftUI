//
//  Horoscope.swift
//  chatApp
//
//  Created by Cody Condon on 2021-08-05.
//

import Foundation


struct Horoscope:  Decodable {
    let current_date: String 
    let color: String
    let description: String
    let lucky_time: String
    let mood: String
    let compatibility: String
    let lucky_number: String 
    
}
