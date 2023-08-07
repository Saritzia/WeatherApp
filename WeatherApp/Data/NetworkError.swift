//
//  NetworkError.swift
//  WeatherApp
//
//  Created by López Martínez Sara on 7/8/23.
//

import Foundation

//An enum containing all the possible errors.
enum NetworkError : Error { case malFormedURL, noData, errorCode(Int?), decoding, other}
