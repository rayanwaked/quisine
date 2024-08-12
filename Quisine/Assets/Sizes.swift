//
//  Sizes.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: - IMPORT
import UIKit
import SwiftUI

// MARK: - UIKIT BOUNDS
let width = UIScreen.main.bounds.width
let height = UIScreen.main.bounds.height

// MARK: - STANDARD PADDING
extension View {
    func standardPadding() -> some View {
        self
            .padding(.horizontal)
            .padding(.leading, 4)
    }
}
