//
//  ContentView.swift
//  W3Dev
//
//  Created by Suryadev Singh on 15/07/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160),spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList,id: \.id) {
                        product in
                        ProductCart(product:product)
                            .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("W3Dev"))
            .toolbar {
                NavigationLink {
                    CartView().environmentObject(cartManager)

                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
