//
//  MapViewActionButton.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/27/25.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var showLocationSearch : Bool
    var body: some View {
        Button{
            withAnimation(.spring()){
                showLocationSearch.toggle()
            }
            
        }label:{
            Image(systemName: showLocationSearch ? "arrow.left": "line.3.horizontal")
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
    MapViewActionButton(showLocationSearch: .constant(true))
}

