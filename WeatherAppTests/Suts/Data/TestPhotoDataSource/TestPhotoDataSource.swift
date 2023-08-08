//
//  TestPhotoDataSource.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 8/8/23.
//

import XCTest
@testable import WeatherApp

final class TestPhotoDataSource: XCTestCase {
    
    var sut : ImageDataSourceProtocol?

    override func setUpWithError() throws {
        try super.setUpWithError()
        //Configuring the mock URLSession
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        //Configuration injection
        let session = URLSession.init(configuration: configuration)
        sut = ImageDataSource(session: session)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testGetDataFromTheApi_whenGetPhoto_expectingData() async throws {
        //Given
        let image = TeleportApiImageModel(photos: [Photos(image: ImageApi(mobile: URL(string: "https://d13k13wj6adfdf.cloudfront.net/urban_areas/madrid-ee355b90b3.jpg")!))])
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            let photo = try JSONEncoder().encode(image)
            return (response, photo)
        }
        //When
        guard let photoResult = try await sut?.getImagesFromTeleportApi(cityName: "") else {
            XCTFail("Forecast must contain the image data")
            return
        }
        //Then
        XCTAssertNotNil(photoResult)
        XCTAssertEqual(photoResult, image)
    }
    
    func testGetDataFromTheApi_whenCouldNotGetData_expectingError() async throws {
        //Given
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 400,httpVersion: nil,headerFields: nil)!
            return (response, nil)
        }
        
        // WHEN
        let photoResult = try? await sut?.getImagesFromTeleportApi(cityName: "")
        
        // THEN
        XCTAssertNil(photoResult)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
