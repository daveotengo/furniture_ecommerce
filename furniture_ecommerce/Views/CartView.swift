//
//  CartView.swift
//  furniture_ecommerce
//
//  Created by David Oteng on 21/07/2023.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager : CartManager
    var body: some View {
        ScrollView{
            if cartManager.products.count > 0{
                ForEach(cartManager.products, id: \.id){product in
                    CartProductView(product: product)
                    
                }
                HStack{
                    Text("Your Total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
                }
                .padding()
                PaymentButton(action: {})
                    .padding()
            }
            else{
                
                Text("Your Cart is Empty")
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
