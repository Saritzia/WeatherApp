//
//  TestDetailViewModel.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 8/8/23.
//

import XCTest
@testable import WeatherApp

final class TestDetailViewModel: XCTestCase {
    
    var sut : WeatherDetailViewModel?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockImageRepostitory = MockPhotoRepository(gotDataPossibility: false)
        sut = WeatherDetailViewModel(cityName: "", imageRepository: mockImageRepostitory, testCompletion: nil)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testDetailViewModel_whenGetPhotoData_expectData() throws {
        //Given
        let mockImageRepostitory = MockPhotoRepository(gotDataPossibility: true)
        //When
        sut = WeatherDetailViewModel(cityName: "", imageRepository: mockImageRepostitory){ image in
            //Then
            XCTAssertNotNil(image)
        }
    }
    
    func testDetailViewModel_whenCouldNotGetPhotoData_expectError() throws {
        //Given
        let mockImageRepostitory = MockPhotoRepository(gotDataPossibility: false)
        //When
        sut = WeatherDetailViewModel(cityName: "", imageRepository: mockImageRepostitory){ image in
            //Then
            XCTAssertNil(image)
        }
    }
    
    func testDetailViewModel_whenGoData_expectEqual() throws {
        //Given
        let photo = TeleportApiImageModel(photos: [Photos(image: ImageApi(mobile: URL(string: "https://d13k13wj6adfdf.cloudfront.net/urban_areas/madrid-ee355b90b3.jpg")!))])
        let mockImageRepostitory = MockPhotoRepository(gotDataPossibility: true)
        //When
        sut = WeatherDetailViewModel(cityName: "", imageRepository: mockImageRepostitory){ image in
            //Then
            XCTAssertEqual(photo, image)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
