//
//  DeveloperPreview.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 7.02.2025.
//

import Foundation

class DeveloperPreview{
    static let shared = DeveloperPreview()
    private init (){
        
    }
    var listings : [Listing] =
    [
        .init(id: UUID().uuidString, ownerId:UUID().uuidString , ownerName:"John Smith" , ownerImageUrl: "male-profile-photo", numberOfBedrooms: 4, numberOfBathrooms: 3, numberOfGuests: 4, numberOfBeds: 4, pricePerNight: 567.5, latitude: 25.7850, longitude: -80.1959, imageURl: ["airbnb1", "airbnb2", "airbnb3", "airbnb4","airbnb5"  ], adress: "124 Main St", city: "Miami", state: "Florida", title: "Miami Villa", rating: 4.86, features: [.selfCheckIn , .superHost], amenties: [.wifi , .alarmSystem , .balcony , .laundry , .tv], type: .villa),
        
            .init(id: UUID().uuidString, ownerId:UUID().uuidString , ownerName:"John Smith" , ownerImageUrl: "male-profile-photo", numberOfBedrooms: 4, numberOfBathrooms: 3, numberOfGuests: 4, numberOfBeds: 4, pricePerNight: 467, latitude: 25.7682, longitude: -80.1959, imageURl: ["airbnb", "airbnb8", "airbnb13", "airbnb18"], adress: "124 Main St", city: "Miami", state: "Florida", title: "Miami Beach House", rating: 4.83, features: [.selfCheckIn , .superHost], amenties: [.wifi , .alarmSystem , .kitchen , .tv], type: .house),
        
            .init(id: UUID().uuidString, ownerId:UUID().uuidString , ownerName:"Steve Johnson" , ownerImageUrl: "male-profile-photo", numberOfBedrooms: 4, numberOfBathrooms: 3, numberOfGuests: 4, numberOfBeds: 4, pricePerNight: 690, latitude: 25.7682, longitude: -80.1959, imageURl: ["airbnb20", "airbnb2", "airbnb3", "airbnb4","airbnb5"  ], adress: "124 Main St", city: "Miami", state: "Florida", title: "Miami apartment in downtown Brickell", rating: 4.32, features: [.selfCheckIn , .superHost], amenties: [.wifi , .alarmSystem , .balcony ], type: .apartment),
        
            .init(id: UUID().uuidString, ownerId:UUID().uuidString , ownerName:"Harry Styles" , ownerImageUrl: "male-profile-photo", numberOfBedrooms: 4, numberOfBathrooms: 3, numberOfGuests: 4, numberOfBeds: 4, pricePerNight: 763, latitude: 34.0549, longitude: -118.2426, imageURl: ["airbnb12", "airbnb6", "airbnb7", "airbnb9","airbnb10"  ], adress: "124 Main St", city: "Los Angeles", state: "California", title: "Beatiful Los Angeles home in Malibu", rating: 4.97, features: [.selfCheckIn , .superHost], amenties: [.wifi , .alarmSystem , .pool , .tv], type: .apartment),
        
           
        
            .init(id: UUID().uuidString, ownerId:UUID().uuidString , ownerName:"Timothy Chalamet" , ownerImageUrl: "male-profile-photo", numberOfBedrooms: 4, numberOfBathrooms: 3, numberOfGuests: 4, numberOfBeds: 4, pricePerNight: 667.5, latitude: 34.0549, longitude: -118.2426, imageURl: ["airbnb21", "airbnb2", "airbnb3", "airbnb4","airbnb5"  ], adress: "124 Main St", city: "Los Angeles", state: "California", title: "Beatiful Los Angeles home in the Hollywood Hills", rating: 4.86, features: [.selfCheckIn , .superHost], amenties: [.wifi , .alarmSystem , .balcony  , .tv], type: .apartment)
    ]
}
