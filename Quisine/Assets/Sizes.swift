//
//  Sizes.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

import UIKit
import SwiftUI

// MARK: - UIKit Bounds
let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

// MARK: - Standard Padding
extension View {
    func standardPadding() -> some View {
        self
            .padding(.horizontal)
            .padding(.leading, 4)
    }
}
