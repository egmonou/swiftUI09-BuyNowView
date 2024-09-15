//
//  BuyNowView.swift
//  BuyNowView
//
//  Created by administrator on 14/09/2024.
//

import SwiftUI

struct BuyNowView: View {
    let price: Double
    let discountPercentage: Int?
    var discountedPrice: Double? {
        if let discountPercentage {
            return (Double(100 - discountPercentage) / 100) * price
        }else {
            return nil
        }
    }
    
    let discountColor: Color
    let bgColor: Color
    let yOffset: Double
    let discountAngle: Double
    
    init(
        price: Double,
        discountPercentage: Int?,
        discountColor: Color = .blue,
        bgColor: Color = .red,
        yOffset: Double = -20,
        discountAngle: Double = -10
    ) {
        self.price = price
        self.discountPercentage = discountPercentage
        self.discountColor = discountColor
        self.bgColor = bgColor
        self.yOffset = yOffset
        self.discountAngle = discountAngle
    }
    
    
    var body: some View {
        VStack {
            if let discountPercentage {
                Text("\(discountPercentage)٪ OFF!")
                    .foregroundStyle(.white)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .padding()
                    .background(discountColor)
                    .clipShape(.rect(cornerRadius: 15))
                    .rotationEffect(Angle(degrees: discountAngle))
                    .offset(y: yOffset)
                    .shadow(radius: 5)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            }
                    
            HStack {
                Text("Buy NOw")
                    .font(.title)
                    .bold()
                Spacer()
                Text("$\(price, specifier: "%.2f")")
                    .foregroundStyle(.white)
                    .strikethrough(discountedPrice != nil)
                if let discountedPrice {
                    Text("\(discountedPrice, specifier: "%.2f")")
                        .bold()
                }

            }
        }
        .padding()
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(bgColor)
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.white)
            }
        )
        .padding()
    }
}

#Preview {
    ZStack {
        Color
            .black
            .opacity(0.7)
            .ignoresSafeArea()
        VStack {
            BuyNowView(
                price: 100,
                discountPercentage: 20
            )
            BuyNowView(
                price: 20,
                discountPercentage: nil
            )
        }
    }
}
