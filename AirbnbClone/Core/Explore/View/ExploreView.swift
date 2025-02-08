//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 29.01.2025.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel =  ExploreViewModel(service: ExpoloreService())
    @State var showSearchDestination = false
  
    var body: some View {
        NavigationStack {
            if showSearchDestination {
                SearchDestinationView(showSearchDestination: $showSearchDestination).environmentObject(viewModel)
                    
                    .padding(.horizontal)
            } else {
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.selectedLocation).onTapGesture {
                        withAnimation(.snappy) {
                            showSearchDestination.toggle()
                        }
                    }
                        .padding(.horizontal)
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { listing in

                            NavigationLink {
                                ListingDetailView(listing: listing)
                            } label: {
                                ListingItemView(listing: listing)
                                    .frame(height: 425)
                            }



                        }
                    }.padding()
                }
            }

        }
    }
}

#Preview {
    ExploreView(viewModel: ExploreViewModel(service: ExpoloreService()))
}
