//
//  ErrorResponse.swift
//  Medivet
//
//  Created by Marcelina Sitko on 13/10/2022.
//

import Foundation

struct ErrorResponse: Decodable {
    let statusCode: Int32
    let message: String
    let error: [String]
}
