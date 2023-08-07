//
//  ImageRepositoryImplementation.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 7/8/23.
//

import Foundation

final class ImageRepositoryImplementation : ImageRepositoryProtocol {
    
    //MARK: -Properties
    private let imageDataSource : ImageDataSourceProtocol
    
    init(imageDataSource: ImageDataSourceProtocol) {
        self.imageDataSource = imageDataSource
    }
    
    //MARK: -Method
    func getImageDataFromDataSource(cityName:String) async throws -> TeleportApiImageModel? {
        let imageFromApi = try? await imageDataSource.getImagesFromTeleportApi(cityName: cityName)
        
        return imageFromApi
    }
}
