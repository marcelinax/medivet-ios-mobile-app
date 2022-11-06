//
//  FormatAddress.swift
//  Medivet
//
//  Created by Marcelina Sitko on 06/11/2022.
//

import SwiftUI

struct FormatAddress: View {
    let city: String?
    let street: String?
    let zipCode: String?
    let buildingNumber: Int?
    let flatNumber: Int?
    
    private let formatAddressController = FormatAddressController()
    
    var body: some View {
        Text(formatAddressController.getAddress(
            street: street,
            buildingNumber: buildingNumber,
            flatNumber: flatNumber,
            zipCode: zipCode,
            city: city
        ))
    }
}


