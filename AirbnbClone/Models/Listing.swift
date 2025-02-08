//
//  Listing.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 7.02.2025.
//

import Foundation

struct Listing : Identifiable , Codable{
    let id : String
    let ownerId : String
    let ownerName : String
    let ownerImageUrl : String
    let numberOfBedrooms : Int
    let numberOfBathrooms : Int
    let numberOfGuests : Int
    let numberOfBeds : Int
    var pricePerNight : Double
    let latitude : Double
    let longitude : Double
    var imageURl    : [String]
    let adress : String
    let city : String
    let state : String
    let title : String
    let rating : Double
    var features : [ListingFeatures]
    var amenties : [ListingAmenties]
    let type : ListingType
}

enum ListingFeatures : Int,Codable , Identifiable{
    
    case selfCheckIn
    case superHost
    
    var imageName : String {
        switch self {
        case .selfCheckIn : return "door.left.hand.open"
        case .superHost : return "medal"
        }
    }
    var id : Int {
        self.rawValue
    }
    
    var title : String {
        switch self {
        case .selfCheckIn : return "Self check-in"
        case .superHost : return "Superhost"
        }
    }
    
    var subtitle : String {
        switch self {
        case .selfCheckIn : return "Check yourself in with the keypad"
        case .superHost : return "Superhost are experienced, highly rated hosts who are commited to providing greate starts for guests"
        }
    }
}

enum ListingAmenties: Int,Codable , Identifiable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    
    var id : Int {
        self.rawValue
    }
    
    
    var title : String{
        switch self {
        case .pool:
            "Pool"
        case .kitchen:
            "Kitchen"
        case .wifi:
            "Wifi"
        case .laundry:
            "Laundry"
        case .tv:
            "TV"
        case .alarmSystem:
            "Alarm System"
        case .office:
            "Office"
        case .balcony:
            "Balcony"
        }
    }
    
    
    var imageName : String {
        switch self {
        case .pool:
            "figure.pool.swim"
        case .kitchen:
            "fork.knife"
        case .wifi:
            "wifi"
        case .laundry:
            "washer"
        case .tv:
            "tv"
        case .alarmSystem:
            "checkmark.shield"
        case .office:
            "pencil.and.ruler.fill"
        case .balcony:
            "building"
        }
    }
}

enum ListingType :Int,Codable , Identifiable{
    case apartment
    case house
    case townHouse
    case villa
    
    
    var id : Int {
        self.rawValue
    }
    
    
    var description : String {
        switch self {
        case .apartment:
            "Apartment"
        case .house:
            "House"
        case .townHouse:
            "Town House"
        case .villa:
            "Villa"
        }
    }
}
