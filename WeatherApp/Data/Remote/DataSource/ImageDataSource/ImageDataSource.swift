//
//  ImageDataSource.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 7/8/23.
//

import Foundation

//The class that calls the photo api service.
final class ImageDataSource : ImageDataSourceProtocol {
    
    //MARK: -Properties
    private let session : URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    //MARK: -Method
    func getImagesFromTeleportApi(cityName:String) async throws -> TeleportApiImageModel? {
        //Form url
        guard let urlFromString = URL(string: "\(K.ImageApi.server)slug:\(cityName)/images/") else {
            throw NetworkError.malFormedURL
        }
        //Create the request
        var request = URLRequest(url: urlFromString)
        request.httpMethod = K.Literals.get
        
        let (data,_) = try await session.data(for: request)
        
        let teleportApiModel = try  JSONDecoder().decode(TeleportApiImageModel.self, from: data)
        
        return teleportApiModel
    }
}
