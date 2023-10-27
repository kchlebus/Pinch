// Created by Kamil Chlebuś on 27/10/2023.

import SwiftUI

struct ThumbnailDrawerView: View {
    @Binding var isDrawerOpen: Bool
    @Binding var isAnimating: Bool

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(8)
                .foregroundStyle(.secondary)
                .onTapGesture {
                    withAnimation(.easeOut) {
                        isDrawerOpen.toggle()
                    }
                }
            Spacer()
        }
        .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 12))
        .opacity(isAnimating ? 1 : 0)
        .frame(width: 260)
        .padding(.top, UIScreen.main.bounds.height / 12)
        .offset(x: isDrawerOpen ? 20: 215)
    }
}

struct ThumbnailDrawerViewPreview: PreviewProvider {
    struct Container: View {
        @State var isDrawerOpen: Bool = false

        var body: some View {
            ThumbnailDrawerView(isDrawerOpen: $isDrawerOpen, isAnimating: .constant(true))
        }
    }

    static var previews: some View {
        Container()
            .previewLayout(.sizeThatFits)
            .offset(x: 70)
    }
}
