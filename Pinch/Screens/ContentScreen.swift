//
//  ContentScreen.swift
//  Pinch
//
//  Created by Kamil Chlebuś on 19/10/2023.
//

import SwiftUI

struct ContentScreen: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero

    private let maxImageScale: CGFloat = 5

    private func resetImageState() {
        withAnimation(.spring) {
            imageScale = 1
            imageOffset = .zero
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.clear

                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(.rect(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                    .padding()
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring) {
                                imageScale = maxImageScale
                            }
                        } else {
                            resetImageState()
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            }
            .animation(.linear(duration: 1), value: isAnimating)
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .overlay(alignment: .top) {
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
            }
            .overlay(alignment: .bottom) {
                BottomControlsView(
                    isAnimating: $isAnimating,
                    imageScale: $imageScale,
                    maxImageScale: maxImageScale,
                    resetImageState: resetImageState
                )
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        ContentScreen()
            .preferredColorScheme(.dark)
    }
}
