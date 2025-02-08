//
//  SearchAndFilterBar.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 29.01.2025.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location : String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            
            VStack(alignment : .leading, spacing: 3) {
                Text(location.isEmpty ?  " Where to?"  : location )
                    .fontWeight(.semibold)
                Text("\(location.isEmpty ? "Any Where"  : location) - Any Week - Add Guest")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "xmark.circle")
                    .foregroundStyle(.black)
            }

        }
        .padding(.horizontal)
        .padding(.vertical , 8)
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(style: StrokeStyle(lineWidth: 0.5))
                .shadow(color: Color.black.opacity(0.4), radius: 2)
        }
        
    }
}

#Preview {
    SearchAndFilterBar(location: .constant("Miami"))
}
