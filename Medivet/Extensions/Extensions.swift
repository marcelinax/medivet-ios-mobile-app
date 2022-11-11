//
//  Extensions.swift
//  Medivet
//
//  Created by Marcelina Sitko on 04/11/2022.
//

import Foundation
import UIKit
import SwiftUI

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8){
            self.append(data)
        }
    }
}

extension DateFormatter {
    func getShortFormat(_ date: Date) -> String {
        self.dateStyle = .short
        self.locale = Locale(identifier: "pl_PL")
        
        return self.string(from: date)
    }
}


extension UIApplication {
    func handleKeyboard() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        guard let window = windowScene?.windows.first else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(limit))
            }
        }
        return self
    }
}
