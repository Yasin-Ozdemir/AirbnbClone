//
//  LogInButton.swift
//  AirbnbClone
//
//  Created by Yasin Özdemir on 4.02.2025.
//

import SwiftUI

struct LogInButton: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Log In")
                .frame(width : 360, height: 48)
                .background(.pink)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .clipShape( RoundedRectangle(cornerRadius: 8))
                .font(.subheadline)
        }

    }
}

#Preview {
    LogInButton()
}
