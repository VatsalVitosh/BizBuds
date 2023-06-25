//
//  KeyboardUtils.swift
//  BizBud
//
//  Created by Vatsal Vitosh on 19/6/23.
//

import Foundation
import UIKit

func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
}
