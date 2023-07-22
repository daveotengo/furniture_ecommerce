//
//  ProductCardView.swift
//  furniture_ecommerce
//
//  Created by David Oteng on 20/07/2023.
//

import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var cartManager: CartManager
    var product : Product
    var body: some View {
        ZStack{
            Color("kSecondary")
            ZStack(alignment: .bottomTrailing){
                VStack(alignment: .leading){
                    Image(product.image)
                        .resizable()
                        .frame(width: 175, height: 160)
                        .cornerRadius(12)
                    
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical, 1)
                    
                    Text(product.supplier)
                        .font(.caption)
                        .padding(.vertical, 0.5)
                    
                    Text("$\(product.price)")
                        .foregroundColor(.black)
                        .bold()
                    
                }
                Button{
                    cartManager.addToCart(product: product)
                }label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color("kPrimary"))
                        .frame(width: 35, height: 35)
                        .padding(.trailing)
                }
            }
        }
        .frame(width: 185, height: 260)
        .cornerRadius(15)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView( product: productList[0])
            .environmentObject(CartManager())
    }
}
