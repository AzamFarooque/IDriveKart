//
//  APIManager.swift
//  IDriveKart
//
//  Created by Farooque Azam on 18/09/21.
//


import Foundation

class APIManager {
    
    static let shared = { APIManager() }()
    
    lazy var baseURL: String = {
        return "https://60d2fa72858b410017b2ea05.mockapi.io/api/v1/menu"
    }()
}
