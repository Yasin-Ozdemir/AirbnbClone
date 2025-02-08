//
//  ProfileOptionRowView.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 4.02.2025.
//

import SwiftUI

struct ProfileOptionRowView: View {
    private let sytemName: String
    private let title :String
    init(sytemName: String, title: String) {
        self.sytemName = sytemName
        self.title = title
    }
    var body: some View {
        VStack {
            HStack {
                Image(systemName: sytemName)
                
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                
            }
            
            Divider()
        }
    }
}

#Preview {
    ProfileOptionRowView(sytemName: "gear", title: "Settings")
}
