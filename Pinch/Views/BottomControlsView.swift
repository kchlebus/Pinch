//
//  BottomControlsView.swift
//  Pinch
//
//  Created by Kamil Chlebuś on 23/10/2023.
//

import SwiftUI

struct BottomControlsView: View {
    @Binding var isAnimating: Bool
    @Binding var imageScale: CGFloat

    let maxImageScale: CGFloat
    let resetImageState: () -> Void

    var body: some View {
        Group {
            HStack {
                Button("", systemImage: "minus.magnifyingglass") {
                    withAnimation(.spring) {
                        if imageScale > 1 {
                            imageScale -= 1
                            if imageScale < 1 {
                                resetImageState()
                            }
                        }
                    }
                }
                Button("", systemImage: "arrow.up.left.and.down.right.magnifyingglass") {
                    resetImageState()
                }
                Button("", systemImage: "plus.magnifyingglass") {
                    withAnimation(.spring) {
                        if imageScale < maxImageScale {
                            imageScale += 1
                            if imageScale > maxImageScale {
                                resetImageState()
                            }
                        }
                    }
                }
            }
            .font(.system(size: 36))
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 12))
            .opacity(isAnimating ? 1 : 0)
        }
        .padding(.bottom, 30)
    }
}

struct BottomControlsViewPreview: PreviewProvider {
    static var previews: some View {
        BottomControlsView(
            isAnimating: .constant(true),
            imageScale: .constant(1),
            maxImageScale: 5,
            resetImageState: {}
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
