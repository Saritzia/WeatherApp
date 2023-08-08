//
//  TestPhotoRepository.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 8/8/23.
//

import XCTest
@testable import WeatherApp

final class TestPhotoRepository: XCTestCase {
    
    var sut : ImageRepositoryProtocol?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockedDataSource = MockPhotoDataSource(getInfoStatus: false)
        sut = ImageRepositoryImplementation(imageDataSource: mockedDataSource)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testPhotoRepository_whenGetData_expectData() async throws {
        //Given
        let mockedDataSource = MockPhotoDataSource(getInfoStatus: true)
        sut = ImageRepositoryImplementation(imageDataSource: mockedDataSource)
        
        //When
        let photo = try? await sut?.getImageDataFromDataSource(cityName: "")
        
        //Then
        XCTAssertNotNil(photo)
    }
    
    func testPhotoRepository_whenGetData_expectEqualData() async throws {
        //Given
        let imageExample = TeleportApiImageModel(photos: [Photos(image: ImageApi(mobile: URL(string: "https://d13k13wj6adfdf.cloudfront.net/urban_areas/madrid-ee355b90b3.jpg")!))])
        let mockedDataSource = MockPhotoDataSource(getInfoStatus: true)
        sut = ImageRepositoryImplementation(imageDataSource: mockedDataSource)
        
        //When
        let photo = try? await sut?.getImageDataFromDataSource(cityName: "")
        
        //Then
        XCTAssertEqual(photo, imageExample)
    }
    
    func testPhotoRepository_whenCouldNotGetData_expectError() async throws {
        //Given
        let mockedDataSource = MockPhotoDataSource(getInfoStatus: false)
        sut = ImageRepositoryImplementation(imageDataSource: mockedDataSource)
        
        //When
        let photo = try? await sut?.getImageDataFromDataSource(cityName: "")
        
        //Then
        XCTAssertNil(photo)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
