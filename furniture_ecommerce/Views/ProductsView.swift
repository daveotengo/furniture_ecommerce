//
//  ProductsView.swift
//  furniture_ecommerce
//
//  Created by David Oteng on 22/07/2023.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: column, spacing: 20){
                    ForEach(productList, id: \.id){product in
                        ProductCardView(product: product)
                    }
                }
                .padding()
            }
            //.navigationTitle(Text("All Furniture"))
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
