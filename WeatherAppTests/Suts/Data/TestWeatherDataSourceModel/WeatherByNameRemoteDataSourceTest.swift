//
//  WeatherByNameRemoteDataSourceTest.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 1/8/23.
//

import XCTest
@testable import WeatherApp

final class WeatherByNameRemoteDataSourceTest: XCTestCase {
    
    var sut : NameSarchedRemoteDataSourceProtocol?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        //Configuring the mock URLSession
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [URLProtocolMock.self]
        //Configuration injection
        let mockURLSession = URLSession.init(configuration: configuration)
        sut = NameSarchedRemoteDataSource(session: mockURLSession)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testNameSearchedRemoteDataSource_whenWeatherRequestStatudCode200_completionReturnForecast() throws {
        //Given
        let expectation = XCTestExpectation(description: "Gotten Forecast Data")
        
        let main = Main(temp: 37, temp_min: 32, temp_max: 37)
        let weather = Weather(id: 100, description: K.ModelConditionName.cloud)
        let list = List(dt: Date(), main: main, weather: [weather])
        let city = City(name: "Madrid")
        let forecast = ForecastDataSourceModel(list: [list], city: city)
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200,httpVersion: nil,headerFields: nil)!
            let forecastData = try JSONEncoder().encode(forecast)
            return (response, forecastData)
        }
        //When
        sut?.getWeatherAPIModel(cityName: "", completion: { forecastResult, error in
            //Then
            XCTAssertEqual(forecastResult, forecast)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testNameSearchedRemoteDataSource_whenStatusCode400_completionReturnError() throws {
        //Given
        let expectation = XCTestExpectation(description: "Gotten Forecast Data")
        
        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 400,httpVersion: nil,headerFields: nil)!
            return (response, nil)
        }
        //When
        sut?.getWeatherAPIModel(cityName: "", completion: { forecastResult, error in
            switch error{
            case .errorCode(let errorCode):
                XCTAssertEqual(errorCode, 400, "The error must be 400")
                expectation.fulfill()
            default:
                XCTFail("This request must throw 400 error")
                expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 1.0)
    }
}
