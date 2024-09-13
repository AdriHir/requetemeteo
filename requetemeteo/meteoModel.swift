//
//  meteoModel.swift
//  requetemeteo
//
//  Created by administrateur on 13/09/2024.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let meteodata = try? JSONDecoder().decode(Meteodata.self, from: jsonData)

import Foundation

// MARK: - Meteodata
struct Meteodata: Codable {
    let city: City
    let update: Date
    let forecast: Forecast
}

// MARK: - City
struct City: Codable {
    let insee: String
    let cp: Int
    let name: String
    let latitude, longitude: Double
    let altitude: Int
}

// MARK: - Forecast
struct Forecast: Codable {
    let insee: String
    let cp: Int
    let latitude, longitude: Double
    let day: Int
    let datetime: Date
    let wind10M, gust10M, dirwind10M: Int
    let rr10, rr1: Double
    let probarain, weather, tmin, tmax: Int
    let sunHours, etp, probafrost, probafog: Int
    let probawind70, probawind100, gustx: Int

    enum CodingKeys: String, CodingKey {
        case insee, cp, latitude, longitude, day, datetime
        case wind10M = "wind10m"
        case gust10M = "gust10m"
        case dirwind10M = "dirwind10m"
        case rr10, rr1, probarain, weather, tmin, tmax
        case sunHours = "sun_hours"
        case etp, probafrost, probafog, probawind70, probawind100, gustx
    }
}
