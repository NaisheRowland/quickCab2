//
//  MapViewActionButton.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/27/25.
//

import SwiftUI

struct MapViewActionButton: View {
    var body: some View {
        Button{
            
        }label:{
            Image(systemName: "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(Color(.white))
                .clipShape(Circle())
                .shadow(color: .black, radius: 10)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
#Preview{
    MapViewActionButton()
}

