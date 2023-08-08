//
//  MockPhotoDataSource.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 8/8/23.
//

import Foundation
@testable import WeatherApp

final class MockPhotoDataSource : ImageDataSourceProtocol {
    //MARK: -Properties
    let photo = TeleportApiImageModel(photos: [Photos(image: ImageApi(mobile: URL(string: "https://d13k13wj6adfdf.cloudfront.net/urban_areas/madrid-ee355b90b3.jpg")!))])
    var getInfoStatus : Bool
    
    init(getInfoStatus : Bool){
        self.getInfoStatus = getInfoStatus
    }
    
    //MARK: -Methods
    func getImagesFromTeleportApi(cityName: String) async throws -> WeatherApp.TeleportApiImageModel? {
        switch getInfoStatus{
        case false : return nil
        case true : return photo
        }
    }
}
