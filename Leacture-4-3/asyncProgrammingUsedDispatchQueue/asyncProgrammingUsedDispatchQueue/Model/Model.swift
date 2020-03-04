//
//  Model.swift
//  asyncProgrammingUsedDispatchQueue
//
//  Created by 김광준 on 2020/03/03.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import Foundation

struct APIResponse: Codable {
    let results: [Friends]
}

struct Friends: Codable {
    
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



/*
 {
 "results": [
   {
     "name": {
       "title": "Ms",
       "first": "ملینا",
       "last": "کریمی"
     },
     "email": "mlyn.khrymy@example.com",
     "picture": {
       "large": "https://randomuser.me/api/portraits/women/46.jpg",
       "medium": "https://randomuser.me/api/portraits/med/women/46.jpg",
       "thumbnail": "https://randomuser.me/api/portraits/thumb/women/46.jpg"
     }
   },
 */
