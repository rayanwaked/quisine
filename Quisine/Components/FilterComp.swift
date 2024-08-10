//
//  Filter.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: IMPORT
import SwiftUI

// MARK: MODEL
class FilterViewModel: ObservableObject {
    @Published var active: Bool = false
}

// MARK: VIEW
struct FilterComp: View {
    @ObservedObject var viewModel = FilterViewModel()
    let label: String
    
    init(label: String) {
        self.label = label
    }
    
    var body: some View {
        HStack {
            Text(label)
                .padding()
                .padding(.trailing, -14)
                .font(.system(size: 14))
                .foregroundStyle(viewModel.active ? Color.black : Color.white)
            Image(systemName: viewModel.active ? "xmark" : "plus")
                .padding([.top, .bottom])
                .padding(.trailing)
                .foregroundStyle(viewModel.active ? Color.black : Color.white)
        }
        .background(viewModel.active ? Color.accentColor : Color.black)
        .animation(.spring, value: viewModel.active)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onTapGesture {
            viewModel.active.toggle()
         }
    }
}

// MARK: PREVIEW
#Preview {
    FilterComp(label: "Japanese")
}
