//
//  HomePageView.swift
//  furniture_ecommerce
//
//  Created by David Oteng on 20/07/2023.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
     
        NavigationStack {
            ScrollView{
                ZStack(alignment: .top){
                    Color.white.edgesIgnoringSafeArea(.all)
                    VStack{
                        AppBar()
                        SearchView()
                        ImageSlliderView()
                        HStack{
                            Text("New Rivals")
                                .font(.title2)
                                .fontWeight(.medium)
                            Spacer()
                           
                            NavigationLink(destination: {
                                ProductsView()
                            }, label: {
                                Image(systemName: "circle.grid.2x2.fill")
                                    .foregroundColor(Color("kPrimary"))
                            })
                            
                        }
                        .padding(.trailing,20)
                        .padding(.leading,20)
                        
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 10){
                                ForEach(productList, id: \.id){ product in
                                    NavigationLink {
                                        ProductDetailsView(product: product)
                                    } label: {
                                        ProductCardView(product: product)
                                            .environmentObject(cartManager)
                                    }
                                    
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        
                    }
                    
                    
                    
                }
                .padding(.bottom, 50)
            }
        }
            
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(CartManager())
    }
}

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
                        .environmentObject(cartManager) ){
                        CartButton(numberOfProducts: cartManager.products.count)
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

        .environmentObject(cartManager)
    }
}
