//
//  ContentView.swift
//  BuyNowView
//
//  Created by administrator on 14/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color
                .black
                .opacity(0.7)
                .ignoresSafeArea()
            VStack {
                
                BuyNowView(
                    price: 100,
                    discountPercentage: 25
                )
                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
