//
//  TopMoversItemView.swift
//  CryptoBroker
//
//  Created by Adewale Sanusi on 05/09/2023.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: coin.image!))
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(.orange)
                .padding(.bottom, 8)
            
            // coin info
            HStack(spacing: 5) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                
                HStack(spacing: 1.5) {
                    Image(systemName: "nairasign")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .opacity(0.4)
                    
                    Text("\(coin.currentPrice.toCurrencyWithDecimals())")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            // coin percentage change
            
            //Text("\(coin.priceChangePercentage24H.toPercentString())")
            Text("\(coin.priceChangePercentage24H.toCurrencyWithDecimals())%")
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H < 0 ? .red : .green)
        }
        .frame(width: 140, height: 140)
        .background(Color("ItemBackgroundColor"))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 1.5)
        }
    }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView()
//    }
//}
