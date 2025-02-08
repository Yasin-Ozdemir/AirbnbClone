//
//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 7.02.2025.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var listingsCopy = [Listing]()
    @Published var selectedLocation = ""
    private let service : ExpoloreService
    
    init(service: ExpoloreService) {
        self.service  =  service
        Task{
            await getListings()
        }
    }
    
    func getListings() async {
        do {
          let listings =   try await service.fetchListings()
            
            
            DispatchQueue.main.async{
                self.listings = listings
                self.listingsCopy = listings
            }
        }catch{
            print(error.localizedDescription)
        }
      
    }
    
    func updateListingForLocation(){
        if selectedLocation.isEmpty {
            listings = listingsCopy
            return
        }
      let filterListings =   listings.filter { $0.city.lowercased() == selectedLocation.lowercased()  ||
            $0.state.lowercased() == selectedLocation.lowercased()}
        
        listings = filterListings.isEmpty ? listingsCopy : filterListings
    }
}
