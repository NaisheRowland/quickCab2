//
//  HomeView.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/27/25.
//
import SwiftUI

struct HomeView : View {
    var body: some View {
        ZStack(alignment: .top) {
            QuickCab2MapViewRepresantable()
                .ignoresSafeArea()
            
            LocationSearchActivationView()
                .padding(.vertical, 72)
            
            MapViewActionButton()
                .padding(.leading)
                .padding(.top, 4)
        }
        
    }
}

#Preview {
    HomeView()
}
