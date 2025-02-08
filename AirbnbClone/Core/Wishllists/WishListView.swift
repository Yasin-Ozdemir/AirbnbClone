//
//  WishListView.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 4.02.2025.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing : 32){
                VStack(alignment: .leading){
                    Text("Log in to view your wishlists")
                        .font(.headline)
                    Text("You can create view or edit wishlists one you've logged in")
                }
                
                LogInButton()
                
                Spacer()
            }.navigationTitle("Wishlist")
        }
    }
}

#Preview {
    WishListView()
}
