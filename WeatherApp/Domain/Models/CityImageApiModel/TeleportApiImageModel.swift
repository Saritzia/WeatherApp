//
//  TeleportApiImageModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 7/8/23.
//

import Foundation

struct TeleportApiImageModel : Codable, Equatable {
    static func == (lhs: TeleportApiImageModel, rhs: TeleportApiImageModel) -> Bool {
        lhs.photos == rhs.photos
    }
    
    let photos : [Photos]
}

struct Photos : Codable, Equatable {
    static func == (lhs: Photos, rhs: Photos) -> Bool {
        lhs.image.mobile == rhs.image.mobile
    }
    
    let image : ImageApi
}

struct ImageApi : Codable {
    let mobile : URL
}

