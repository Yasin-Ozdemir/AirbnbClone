//
//  ListingItemView.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 29.01.2025.
//

import SwiftUI

struct ListingItemView: View {
    private var listing: Listing
    init(listing: Listing) {
        self.listing = listing
    }
    var body: some View {
        VStack(spacing: 8){
            ListHeaderView(images: listing.imageURl)
                .frame(height: 320)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 3) {
                    Text(listing.city + "," + listing.state).fontWeight(.bold).foregroundStyle(.black)
                    
                    Text("12 mi way").foregroundStyle(.gray)
                    
                    Text("Nov 3 - Nov 10").foregroundStyle(.gray)
                    
                    HStack(spacing : 4) {
                        Text(listing.pricePerNight.toTwoDecimalString())
                            .fontWeight(.bold).foregroundStyle(.black)
                        
                        Text("night").foregroundStyle(.black)
                    }
                }
                Spacer()
                HStack(spacing:2) {
                    Image(systemName: "star.fill")
                    Text(listing.rating.toTwoDecimalString())
                    
                }.foregroundStyle(.black)
            }
        
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
