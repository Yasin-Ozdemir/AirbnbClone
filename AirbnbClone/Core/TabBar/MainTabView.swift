//
//  MainTabView.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 4.02.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView(viewModel: ExploreViewModel(service: ExpoloreService())).tabItem {
                Image(systemName: "magnifyingglass")
                Text("Explore")
            }
            WishListView().tabItem {
                Image(systemName: "heart")
                Text("Wishlist")
            }
            ProfileView().tabItem {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            }
           
            
        }.tint(.pink)
    }
}

#Preview {
    MainTabView()
}
