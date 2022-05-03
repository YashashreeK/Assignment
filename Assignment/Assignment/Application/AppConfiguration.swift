//
//  AppConfiguration.swift
//  Assignment
//
//  Created by Yashashree on 02/05/22.
//


import Foundation

final class AppConfiguration {
    lazy var apiBaseURL: String = {
        return "https://api.coincap.io/v2"
    }()
}
