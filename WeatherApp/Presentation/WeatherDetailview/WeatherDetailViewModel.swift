//
//  WeatherDetailViewModel.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 7/8/23.
//

import Foundation

final class WeatherDetailViewModel : ObservableObject {
    //MARK: -Properties
    private var cityName : String
    @Published var photo : URL?
    private let imageRepository : ImageRepositoryProtocol?
    
    init(cityName : String, imageRepository : ImageRepositoryProtocol, testCompletion: ((TeleportApiImageModel?)->())?) {
        self.cityName = cityName
        self.imageRepository = imageRepository
        DispatchQueue.main.async {
            Task{
                guard let gotImageFromRepository = try? await self.imageRepository?.getImageDataFromDataSource(cityName: self.cityName) else {return}
                self.photo = gotImageFromRepository.photos.first?.image.mobile
                testCompletion?(gotImageFromRepository)
            }
        }
    }
}
