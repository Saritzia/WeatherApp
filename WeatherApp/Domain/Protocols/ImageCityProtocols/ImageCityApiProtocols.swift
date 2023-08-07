//
//  ImageCityApiProtocols.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 7/8/23.
//

import Foundation

//MARK: -ImageDataSourceProtocol
protocol ImageDataSourceProtocol{
    func getImagesFromTeleportApi(cityName:String) async throws -> TeleportApiImageModel?
}

//MARK: -ImageRepositoryProtocol
protocol ImageRepositoryProtocol{
    func getImageDataFromDataSource(cityName:String) async throws -> TeleportApiImageModel?
}
