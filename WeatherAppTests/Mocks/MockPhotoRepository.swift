//
//  MockPhotoRepository.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 8/8/23.
//

import Foundation
@testable import WeatherApp

final class MockPhotoRepository : ImageRepositoryProtocol{
    //MARK: -Properties
    var gotDataPossibility : Bool
    let photo = TeleportApiImageModel(photos: [Photos(image: ImageApi(mobile: URL(string: "https://d13k13wj6adfdf.cloudfront.net/urban_areas/madrid-ee355b90b3.jpg")!))])
    
    init(gotDataPossibility: Bool) {
        self.gotDataPossibility = gotDataPossibility
    }
    
    //MARK: -Methods
    func getImageDataFromDataSource(cityName: String) async throws -> WeatherApp.TeleportApiImageModel? {
        switch gotDataPossibility{
        case true : return photo
        case false : return nil
        }
    }
}
