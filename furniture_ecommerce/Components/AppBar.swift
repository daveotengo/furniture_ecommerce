//
//  AppBar.swift
//  furniture_ecommerce
//
//  Created by David Oteng on 22/07/2023.
//

import SwiftUI

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                HStack{
                    
                    Image(systemName: "location.north.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                    
                    Text("Shangai ,  China")
                    .font(.title2)
                    .foregroundColor(.gray)
                    
                    Spacer()
                    
                    NavigationLink(destination: CartView()
                        .environmentObject(cartManager)
                    ){
                        CartButton(numberOfProducts: cartManager.products.count)
                            .environmentObject(cartManager)
                    }
                }
                
                Text("Find the Most \nLuxurious")
                    .font(.largeTitle .bold())
                + Text(" Furniture")
                    .font(.largeTitle .bold())
                    .foregroundColor(Color("kPrimary"))
                
            }
        }
        .padding(.leading, 20)
        .padding(.trailing, 20)
    }
}

struct AppBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar()
            .environmentObject(CartManager())

    }
}
