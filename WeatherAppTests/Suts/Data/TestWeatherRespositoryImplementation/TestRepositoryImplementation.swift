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
//MARK: -By city name
    func testDataGotFromDataSource_whenDataNotEmpty_completionReturnData() throws {
        //Given
        let mockedRemotedataSource = MockWeatherRemoteDataSource(weatherGotPossibility: true)
        sut = RepositoryImplementation(remoteDataSource: mockedRemotedataSource)
        //When
        sut?.getDataWeatherFromName(fromName: "", completion: { forecast, error in
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
        sut?.getDataWeatherFromName(fromName: "", completion: { forecast, error in
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
        sut?.getDataWeatherFromName(fromName: "", completion: { forecast, error in
            //Then
            XCTAssertEqual(forecast, .init(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200)]),"An error must be thrown")
        })
    }
    
    //MARK: -By location
    func testDataGotFromDataSourceUsingLocation_whenGotData_expectSameData() async throws {
        //Given
        let mockedRemotedataSource = MockWeatherRemoteDataSource(weatherGotPossibility: true)
        sut = RepositoryImplementation(remoteDataSource: mockedRemotedataSource)
        //When
        let forecast = try? await sut?.getDataWeatherFromLocation(latitude: 0.0, longitude: 0.0)
        //Then
        XCTAssertEqual(forecast, .init(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200)]),"An error must be thrown")
        XCTAssertNotNil(forecast,"Could not get forecast data")
    }
    
    func testDataGotFromDataSourceUsingLocation_whenFail_expectError() async throws {
        //Given
        let mockedRemotedataSource = MockWeatherRemoteDataSource(weatherGotPossibility: false)
        sut = RepositoryImplementation(remoteDataSource: mockedRemotedataSource)
        //When
        let forecast = try? await sut?.getDataWeatherFromLocation(latitude: 0.0, longitude: 0.0)
        //Then
        XCTAssertNil(forecast)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
