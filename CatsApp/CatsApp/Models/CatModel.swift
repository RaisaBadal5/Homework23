//
//  CatModel.swift
//  CatsApp
//
//  Created by Default on 03.05.24.
//

import Foundation

struct CatModel: Decodable {
    var fact: String
    var lenght: Int
    enum CodingKeys: String, CodingKey {
        case fact
        case lenght
    }
    
}
