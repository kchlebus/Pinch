// Created by Kamil Chlebuś on 27/10/2023.

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        "thumb-" + imageName
    }
}
