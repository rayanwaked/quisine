//
//  FeatureComp.swift
//  Quisine
//
//  Created by Rayan Waked on 8/9/24.
//

// MARK: - IMPORT
import SwiftUI

// MARK: - VIEW
struct FeatureComp: View {
    let name: String
    let url: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                image(for: geometry)
            }
        }
        .padding()
    }
}

// MARK: - IMAGE STYLE
private extension FeatureComp {
    func image(for geometry: GeometryProxy) -> some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: geometry.size.width, height: 200)
            .clipped()
            .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(name.capitalized)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        Color.background
                            .clipShape(CustomCornerShape(radius: 20, corners: .topRight))
                    )
            }
        }
    }
}

// MARK: - CORNER SHAPE
struct CustomCornerShape: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    FeatureComp(
        name: "Chocolate Lava Cake",
        url: "https://www.themealdb.com/images/media/meals/xqwwpy1483908697.jpg"
    )
}
