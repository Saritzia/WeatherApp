//
//  TeleportApiImageModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 7/8/23.
//

import Foundation

struct TeleportApiImageModel : Codable {
    let photos : [Photos]
}

struct Photos : Codable {
    let image : ImageApi
}

struct ImageApi : Codable {
    let mobile : URL
}
//An enum that allows renaming of api properties in order to avoid ambiguity with Image
enum LiteralNamesFromAPi : String{
    case ImageApi = "image"
}
