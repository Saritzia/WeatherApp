//
//  TestRootViewModel.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 5/8/23.
//

import XCTest
@testable import WeatherApp

final class TestRootViewModel: XCTestCase {
    
    var sut : RootViewModelProtocol?

    override func setUpWithError() throws {
        try super.setUpWithError()
        let mockRepository = MockRepository(gotData: false)
        sut = RootViewModel(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRootViewModel_whenGotData_expectData() throws {
        //Given
        let mockRepository = MockRepository(gotData: true)
        sut = RootViewModel(repository: mockRepository)
        
        //When
        sut?.getForecastWeatherDataFromRepository(cityName: "")
        
        //Then
        XCTAssertNotNil(sut?.forecast, "Forecast must have data")
        XCTAssertNotNil(sut?.forecastByDay, "ForcastByDay must not be empty")
    }
    
    func testRootViewModel_whenGotDataCompareData_expectEqualData() throws {
        //Given
        let mockRepository = MockRepository(gotData: true)
        sut = RootViewModel(repository: mockRepository)
        
        //When
        sut?.getForecastWeatherDataFromRepository(cityName: "")
        
        //Then
        XCTAssertEqual(sut?.forecast, WeatherModel(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200)]),"Forecast must have data")
        XCTAssertEqual(sut?.forecastByDay, [WeatherModel(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200)])],"ForcastByDay must not be empty")
    }
    
    func testRootViewModel_whenGotAnError_expectError() throws {
        //Given
        let mockRepository = MockRepository(gotData: false)
        sut = RootViewModel(repository: mockRepository)
        
        //When
        sut?.getForecastWeatherDataFromRepository(cityName: "")
        
        //Then
        XCTAssertNil(sut?.forecast, "Must haven an error")
        XCTAssertEqual(sut?.forecastByDay, [], "ForcastByDay must not be empty")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
