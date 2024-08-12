//
//  Filter.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: IMPORT
import SwiftUI

// MARK: VIEW
struct FilterComp: View {
    let label: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text(label)
                .padding()
                .padding(.trailing, -14)
                .font(.system(size: 14))
                .foregroundStyle(isActive ? Color.black : Color.white)
            Image(systemName: isActive ? "xmark" : "plus")
                .padding([.top, .bottom])
                .padding(.trailing)
                .foregroundStyle(isActive ? Color.black : Color.white)
        }
        .background(isActive ? Color.accentColor : Color.black)
        .animation(.spring, value: isActive)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onTapGesture(perform: action)
    }
}
// MARK: PREVIEW
#Preview {
    FilterComp(label: "Japanese", isActive: true) {
        // Function
    }
}
