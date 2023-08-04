//
//  TestRepositoryImplementation.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 2/8/23.
//

import XCTest
@testable import WeatherApp

final class TestRepositoryImplementation: XCTestCase {
    
    var sut : RepositoryImplementationProtocol?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testDataGotFromDataSource_whenDataNotEmpty_completionReturnData() throws {
        //Given
        let mockedRemotedataSource = MockWeatherRemoteDataSource(weatherGotPossibility: true)
        sut = RepositoryImplementation(remoteDataSource: mockedRemotedataSource)
        //When
        sut?.getDataWeather(fromName: "", completion: { forecast, error in
            //Then
            XCTAssertNotNil(forecast,"Could not get forecast data")
        }
        )
    }
    
    func testDataGotFromDataSource_whenGotAnError_completionReturnError() throws {
        //Given
        let mockedRemotedataSource = MockWeatherRemoteDataSource(weatherGotPossibility: false)
        sut = RepositoryImplementation(remoteDataSource: mockedRemotedataSource)
        //When
        sut?.getDataWeather(fromName: "", completion: { forecast, error in
            //Then
            XCTAssertNotNil(error,"An error must be thrown")
        }
        )
    }
    
    func testDataGotFromDataSource_whenGotData_expectSameData() throws {
        //Given
        let mockedRemotedataSource = MockWeatherRemoteDataSource(weatherGotPossibility: true)
        sut = RepositoryImplementation(remoteDataSource: mockedRemotedataSource)
        //When
        sut?.getDataWeather(fromName: "", completion: { forecast, error in
            //Then
            XCTAssertEqual(forecast, .init(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: Date(timeIntervalSince1970: 1690902000), conditionId: 200, description: "cloud")]),"An error must be thrown")
            
           
        }
        )
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
