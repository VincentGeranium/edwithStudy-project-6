//
//  Model.swift
//  Networking
//
//  Created by 김광준 on 2020/02/12.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import Foundation

struct APIResponse: Codable {
    let results: [Friend]
}

struct Friend: Codable {
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
        
        var full: String {
            return self.title.capitalized + ". " + self.first.capitalized + " " + self.last.capitalized
        }
    }
    
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
    
    let name: Name
    let email: String
    let picture: Picture
}


