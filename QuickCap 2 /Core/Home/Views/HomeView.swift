//
//  HomeView.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/27/25.
//
import SwiftUI

struct HomeView : View {
    @State private var showLocationSearchView = false
    var body: some View {
        ZStack(alignment: .top) {
            QuickCab2MapViewRepresantable()
                .ignoresSafeArea()
            
            
            if showLocationSearchView {
                LocationSearchView()
            }else{
                LocationSearchActivationView()
                    .padding(.vertical, 72)
                    .onTapGesture{
                        withAnimation(.spring()){
                            showLocationSearchView.toggle()
                        }
                        
                    }
            }
            
            MapViewActionButton(showLocationSearch: $showLocationSearchView)
                .padding(.leading)
                .padding(.top, 4)
        }
        
    }
}

#Preview {
    HomeView()
}
