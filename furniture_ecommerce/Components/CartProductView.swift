//
//  CartProductView.swift
//  furniture_ecommerce
//
//  Created by David Oteng on 21/07/2023.
//

import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        HStack(spacing:20){
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(9)
            VStack(alignment: .leading, spacing: 5){
                Text(product.name)
                    .bold()
                Text("$\(product.price)")
                    .bold()
            }
            .padding()
            Spacer()
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .background(Color("kSecondary"))
        .cornerRadius(12)
        .frame(width:.infinity, alignment: .leading)
        .padding()
    }
}

struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        CartProductView(product: productList[2])
            .environmentObject(CartManager())
    }
}
