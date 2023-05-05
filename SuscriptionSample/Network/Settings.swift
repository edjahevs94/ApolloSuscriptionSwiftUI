//
//  Settings.swift
//  SuscriptionSample
//
//  Created by EdgardVS on 4/05/23.
//

import Foundation


class Settings {
    
    static let shared = Settings()
    
    struct Config {
        let token: String
        let urlString: String
        let urlWsString: String
        
    }
    
    private static var config: Config?
    
    let token: String
    let urlString: String
    let urlWsString: String
    
    class func setup(_ config: Config) {
        Settings.config = config
    }
    
    private init() {
        guard let config = Settings.config else {
            fatalError("Error-Debes configurar el cliente de apollo antes de usarlo")
        }
        token = config.token
        urlString = config.urlString
        urlWsString = config.urlWsString
    }
    
    
}
