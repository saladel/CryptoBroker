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
            // TODO: Add image from url using Async image
            //AsyncImage(url: "\(coin.image)")
            
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
                    
                    Text("\(coin.currentPrice)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            
            // coin percentage change
            Text("\(coin.priceChangePercentage24H)")
                .font(.title2)
                .foregroundColor(.green)
        }
        .frame(width: 140, height: 140)
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
