//
//  ListingDetailView.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 30.01.2025.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    @Environment(\.dismiss) var dismiss
    private let listing : Listing
    @State private var cameraPosition : MapCameraPosition
    init(listing: Listing) {
        self.listing = listing
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    var body: some View {
        ScrollView {
            VStack{
                ZStack(alignment: .topLeading) {
                    
                    ListHeaderView(images: listing.imageURl)
                        .frame(height: 320)
                    
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.backward.circle").resizable().frame(width: 25 , height: 25)
                            .padding(.top , 25)
                            .padding(20).foregroundStyle(.white)
                            
                    }

                }
                
                VStack(alignment: .leading) {
                    Text(listing.title)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    HStack(spacing:2) {
                        Image(systemName: "star.fill")
                        
                        Text(listing.rating.toTwoDecimalString())
                        
                        Text ("-")
                        
                        Text("19 reviews")
                    }
                    Text(listing.city + "," + listing.state)
                   
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Divider()
                
                
                HStack {
                    VStack(alignment : .leading) {
                        Text("Entire \(listing.type.description) hosted by").font(.headline)
                        Text(listing.ownerName).font(.headline)
                        HStack(spacing: 1) {
                            Text("\(listing.numberOfGuests) Guest - ")
                            Text("\(listing.numberOfBedrooms) Bedrooms - ")
                            Text("\(listing.numberOfBeds) Beds - ")
                            Text("\(listing.numberOfBathrooms) Baths")
                        }.font(.caption)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "person.circle").resizable().frame(width: 60 , height: 60)
                }.padding()
                
                
                Divider()
                
                
                VStack(spacing: 16) {
                    superhostView
  
                }.padding()
                
                
                Divider()
                
                
                bedroomsView
                    .padding()
                
                
                Divider()
                
                
                placeOffersView
                    .frame(maxWidth : .infinity, alignment: .leading).padding()
                
                
                Divider()
                
                
                mapView
                    .padding()
                
            }
        }
        .overlay(alignment: .bottom) {
            VStack{
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack {
                        Text("$" + listing.pricePerNight.toTwoDecimalString()).fontWeight(.semibold)
                        Text("Total before taxes").font(.footnote)
                        Text("Oct 15 - 20").fontWeight(.bold).underline().font(.footnote)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Reserve")
                            .frame(width: 140, height: 40)
                            .foregroundStyle(.white)
                            .background {
                            Color.pink
                        }
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                } .padding()
            }
           
            .background{
                Color.white
            }
        }
        .navigationBarBackButtonHidden(true)
       
        
        .toolbarVisibility(.hidden, for: .tabBar)
        .toolbarVisibility(.hidden, for: .navigationBar)
        .ignoresSafeArea()
     
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}


extension ListingDetailView {
    private var superhostView : some View {
        ForEach(listing.features) { feature in
            HStack(spacing: 12) {
                Image(systemName: feature.imageName)
                
                VStack(alignment: .leading) {
                    Text(feature.title).fontWeight(.semibold).font(.footnote)
                    
                    Text(feature.subtitle).font(.caption).foregroundStyle(.gray)
                }
                
                Spacer()
            }
        }
      
    }
    
    private var bedroomsView : some View {
        VStack(alignment: .leading, spacing: 16){
            Text("Where you'll sleep")
                .font(.headline)
            
            ScrollView(.horizontal , showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(1..<Int(listing.numberOfBeds)) {bedroom in
                        VStack {
                            Image(systemName: "bed.double")
                            Text("Bedroom \(bedroom)")
                        }
                        .frame(width: 130, height: 100)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle(lineWidth: 1))
                        }
                    }
                }
            }.scrollTargetBehavior(.paging)
        }
    }
    
    private var placeOffersView : some View {
        VStack(alignment: .leading, spacing: 16){
            Text("What this place offers").font(.headline)
            
            ForEach(listing.amenties){ ament in
                HStack{
                    Image(systemName: ament.imageName)
                    
                    Text("\(ament.title)").font(.footnote)
                }
            }
        }
    }
    
    private var mapView : some View {
        VStack(alignment: .leading, spacing: 16, content: {
            Text("Where you'll be").font(.headline)
            Map(position: $cameraPosition)
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }).padding(.bottom, 100)
    }
}
