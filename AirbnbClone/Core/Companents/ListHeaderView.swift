//
//  ListHeaderView.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 30.01.2025.
//

import SwiftUI

struct ListHeaderView: View {
    private var images : [String]
    init(images: [String] ) {
        self.images = images
    }
    var body: some View {
        TabView(content: {
            ForEach(images, id: \.self) { image in
                Image(image).resizable().scaledToFill()
            }
        })
          
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .tabViewStyle(.page)
    }
}

#Preview {
    ListHeaderView(images: DeveloperPreview.shared.listings[0].imageURl)
}
