//
//  CoinRowView.swift
//  CryptoBroker
//
//  Created by Adewale Sanusi on 05/09/2023.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            // market rank
            Text(" \(round(coin.marketCapRank ?? 1))")
                .font(.caption)
                .foregroundColor(.gray)
            
            // image
            KFImage(URL(string: coin.image!))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            // coin name info
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            
            // coin price info
            VStack(alignment: .trailing, spacing: 4) {
                
                HStack(spacing: 0) {
                    Image(systemName: "nairasign")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 11, height: 11)
                    //.opacity(0.4)
                    
                    Text("\(coin.currentPrice.toCurrencyWithDecimals())")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        //.padding(.leading, 4)
                }
                
                if coin.priceChangePercentage24H < 0 {
                    Text("\(coin.priceChangePercentage24H)")
                        .font(.caption)
                        .padding(.leading, 6)
                        .foregroundColor(.red)
                } else {
                    Text("\(coin.priceChangePercentage24H)")
                        .font(.caption)
                        .padding(.leading, 6)
                        .foregroundColor(.green)
                }
                
                
            }
            .padding(.leading, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView()
//    }
//}
