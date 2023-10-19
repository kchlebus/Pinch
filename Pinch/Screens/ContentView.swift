//
//  ContentView.swift
//  Pinch
//
//  Created by Kamil Chlebuś on 19/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1.0

    var body: some View {
        NavigationStack {
            ZStack {
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(imageScale)
                    .padding()
                    .onTapGesture(count: 2) {
                        imageScale = imageScale == 1 ? 5 : 1
                    }
            }
            .animation(.linear(duration: 1), value: isAnimating)
            .animation(.spring, value: imageScale)
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
