//
//  UserProfileScreenController.swift
//  Medivet
//
//  Created by Marcelina Sitko on 01/11/2022.
//

import UIKit

class UserProfileScreenController: UIViewController, ObservableObject {

    func toggleGenderPickerValue(_ value: Gender) -> Gender {
        if value == Gender.female {
            return Gender.male
        }
        else {
            return Gender.female
        }
    }

}
