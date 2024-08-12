//
//  CheckboxComp.swift
//  Quisine
//
//  Created by Rayan Waked on 8/11/24.
//

// MARK: - IMPORT
import SwiftUI

// MARK: - VIEW
struct CheckboxComp: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")

                configuration.label
            }
        })
    }
}

// MARK: - PREVIEW
#Preview {
    CheckboxComp() as! any View
}
