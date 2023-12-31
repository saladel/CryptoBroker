//
//  HomeView.swift
//  CryptoBroker
//
//  Created by Adewale Sanusi on 05/09/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            //ScrollView (.vertical, showsIndicators: false)
            VStack {
                // top movers view
                TopMoversView(viewModel: viewModel)
                
                Divider ()
                
                // all coins view
                AllCoinsView (viewModel: viewModel)
            }
            . navigationTitle("Live Prices")
            .background(Color("ItemBackgroundColor"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
