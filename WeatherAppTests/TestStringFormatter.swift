//
//  TestStringFormatter.swift
//  WeatherAppTests
//
//  Created by López Martínez Sara on 10/8/23.
//

import XCTest
@testable import WeatherApp

final class TestStringFormatter: XCTestCase {
    let temperatureString = "30.0ºC"

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testFormatterString_whenSuccess_expectCorrectData() throws {
        let temperature = 30.0
        let temperatureFormatted = TemperatureFormatter.temperatureToString(temperature: temperature)
        XCTAssertEqual(temperatureFormatted, temperatureString)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
