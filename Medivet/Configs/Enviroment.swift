//
//  Enviroment.swift
//  Medivet
//
//  Created by Marcelina Sitko on 12/10/2022.
//

import Foundation

public enum Environment {
  // MARK: - Keys
  enum Keys {
    enum Plist {
      static let apiUrl = "API_URL"
    }
  }

  // MARK: - Plist
  private static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("Plist file not found")
    }
    return dict
  }()

  // MARK: - Plist values
  static let apiUrl: URL = {
    guard let apiURLstring = Environment.infoDictionary[Keys.Plist.apiUrl] as? String else {
      fatalError("Api URL not set in plist for this environment")
    }
    guard let url = URL(string: apiURLstring) else {
      fatalError("Api URL is invalid")
    }
    return url
  }()
}
