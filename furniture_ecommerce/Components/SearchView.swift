//
//  SearchView.swift
//  furniture_ecommerce
//
//  Created by David Oteng on 20/07/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "maginfyingglass")
                    .padding(.leading)
                TextField("Seach For Furniture", text: $search)
                    .padding()
            }
            .background(Color("kSecondary"))
            .cornerRadius(10)
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color("kPrimary"))
                .cornerRadius(12)
        }
        .padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
