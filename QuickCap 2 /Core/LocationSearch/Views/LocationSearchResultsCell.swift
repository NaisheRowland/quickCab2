//
//  LocationSearchResultsCellCell.swift
//  QuickCab2
//
//  Created by Naishe Rowland  on 10/27/25.
//

import SwiftUI

struct LocationSearchResultsCell: View {
    let title : String
    let subTitle : String
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.blue)
                .frame(width: 40,height: 40)
                .accentColor(.white)
            
            VStack(alignment: .leading, spacing: 4){
                Text(title)
                    .font(.body)
                Text(subTitle)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                
                
                Divider()
            }
           
            .padding(.leading, 8)
            .padding(.vertical, 8)
            
        }
        .padding(.leading)
    }
}
#Preview {
    LocationSearchResultsCell(title: "MCRI", subTitle: "BB7 Aerodrome")
}

