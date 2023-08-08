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

    func testRootViewModelUsingCityName_whenGotData_expectData() throws {
        //Given
        let mockRepository = MockRepository(gotData: true)
        sut = RootViewModel(repository: mockRepository)
        
        //When
        sut?.getForecastWeatherDataFromRepository(cityName: ""){ forecast, forecastByDay in
            //Then
            XCTAssertNotNil(forecast, "Forecast must have data")
            XCTAssertNotNil(forecastByDay, "ForcastByDay must not be empty")
        }
    }
    
    func testRootViewModel_whenGotDataCompareDataUsingCityName_expectEqualData() throws {
        //Given
        let mockRepository = MockRepository(gotData: true)
        sut = RootViewModel(repository: mockRepository)
        
        //When
        sut?.getForecastWeatherDataFromRepository(cityName: ""){ forecast,forecastByDay  in
            //Then
            XCTAssertEqual(forecast, WeatherModel(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200)]),"Forecast must have data")
            XCTAssertEqual(forecastByDay, [WeatherModel(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200)])],"ForcastByDay must not be empty")
        }
    }
    
    func testRootViewModel_whenGotAnErrorUsingCityName_expectError() throws {
        //Given
        let mockRepository = MockRepository(gotData: false)
        sut = RootViewModel(repository: mockRepository)
        
        //When
        sut?.getForecastWeatherDataFromRepository(cityName: ""){forecast,forecastByDay  in
            //Then
            XCTAssertNil(forecast, "Must haven an error")
            XCTAssertEqual(forecastByDay, [], "ForcastByDay must not be empty")
        }
    }
    func testRootViewModel_whenGotDataCompareDataUsingLocation_expectEqualData() async throws {
        //Given
        let mockRepository = MockRepository(gotData: true)
        sut = RootViewModel(repository: mockRepository)
        
        //When
        try await sut?.getDataWeatherFromLocation(latitude: 0.0, longitude: 0.0){ forecast, forecastByDay in
            //Then
            XCTAssertEqual(forecast, WeatherModel(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200)]),"Forecast must have data")
            XCTAssertEqual(forecastByDay, [WeatherModel(cityName: "Madrid", weatherDataArray: [WeatherDataArray(temperature: 37, minTemperature: 32, maxTemperature: 37, date: "martes, ago. 1", conditionId: 200)])],"Forecast must have data")
        }
    }
    
    func testRootViewModelUsingLocation_whenGotData_expectData() async throws {
        //Given
        let mockRepository = MockRepository(gotData: true)
        sut = RootViewModel(repository: mockRepository)
        
        //When
        
        try await sut?.getDataWeatherFromLocation(latitude: 0.0, longitude: 0.0){ forecast,forecastByDay  in
            //Then
            XCTAssertNotNil(forecast, "Forecast must have data")
            XCTAssertNotNil(forecastByDay, "Forecast must have data")
        }
    }
    
    func testRootViewModel_whenGotAnErrorUsingLocation_expectError() async throws {
        //Given
        let mockRepository = MockRepository(gotData: false)
        sut = RootViewModel(repository: mockRepository)
        
        //When
        try? await sut?.getDataWeatherFromLocation(latitude: 0.0, longitude: 0.0){ forecast, forecastByDay in
            //Then
            XCTAssertNil(forecast, "Must haven an error")
            XCTAssertNil(forecastByDay, "Must haven an error")
        }
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
