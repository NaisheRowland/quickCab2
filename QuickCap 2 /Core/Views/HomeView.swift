//
//  HomeView.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/27/25.
//
import SwiftUI

struct HomeView : View {
    var body: some View {
        QuickCab2MapViewRepresantable()
            .ignoresSafeArea()
        
    }
}

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
