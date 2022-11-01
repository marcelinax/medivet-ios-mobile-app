//
//  Gender.swift
//  Medivet
//
//  Created by Marcelina Sitko on 23/10/2022.
//

import Foundation

enum Gender: String, Decodable {
    case female, male
    var id: Self { self }
}
