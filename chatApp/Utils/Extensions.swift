//
//  Extensions.swift
//  chatApp
//
//  Created by Cody Condon on 2021-07-26.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
