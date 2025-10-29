//
//  LocationSearchView.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/27/25.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var showLoactionSearchView : Bool
    @EnvironmentObject var viewModel : LocationSearchViewModel
    var body: some View {
        VStack{
            // HEADER VIEW
            
            HStack {
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(Color(.black))
                        .frame(width: 6, height: 6)
                }
                VStack{
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                    
                    
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding()
            
           
            
            // LIST VIEW
            
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.searchResults, id: \.self){
                        result in LocationSearchResultsCell(title: result.title, subTitle: result.subtitle)
                            .onTapGesture {
                                viewModel.selectLocation(result)
                                showLoactionSearchView.toggle()
                                
                            }
                    }
                    
                }
            }
            
        }
        .background(.white)
        
    }
}
#Preview {
    LocationSearchView(showLoactionSearchView: .constant(false))
}
