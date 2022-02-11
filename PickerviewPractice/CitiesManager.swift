//
//  CitiesManager.swift
//  PickerviewPractice
//
//  Created by YJ on 2022/02/11.
//

import Foundation

struct CitiesManager {
    let cities = [
        City(name: "Seoul", tourAttractions: ["Nam Mt", "Gyeongbok-Gung", "Han River"]),
        City(name: "New York", tourAttractions: ["Times Square", "Central Park", "MOMA"])
    ]
}

struct City {
    let name: String
    let tourAttractions: [String]
}
