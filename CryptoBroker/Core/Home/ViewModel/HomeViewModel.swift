//
//  HomeViewModel.swift
//  CryptoBroker
//
//  Created by Adewale Sanusi on 05/09/2023.
//

import Foundation

//https://api.coingecko.com/api/v3/coins/markets?vs_currency=ngn&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en

//"https://api.coingecko.com/api/v3/coins/markets?vs_currency=ngn&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en&precision=2"

class HomeViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    
    init() {
        fetchCoinData()
        
        // A timer to fetch data every 30 seconds
        let timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { _ in
            self.fetchCoinData()
        }
        
        // Ensure the timer is scheduled on the main run loop to work properly with SwiftUI
        RunLoop.main.add(timer, forMode: .common)
        
        
    }
    
    func fetchCoinData(){
        
        // Prints a timestamp when the request is made
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let timestamp = dateFormatter.string(from: Date())
        print("Automatic request made at \(timestamp)")
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=ngn&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en&precision=5"
        
        // convert url to a url object
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            // handling error
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return // if no error function stops here
            }
            
            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response code \(response.statusCode)") // prints the http response from the API call
            }
            
            guard let data = data else {return} // gets data if not stop function here
            let dataToString = String(data: data, encoding: .utf8)
            print("DEBUG: Data \(String(describing: dataToString))")
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
                print("DEBUG: Coins \(coins)")
            } catch let error {
                print("DEBUG: Failed to decode with error: \(error)")
            }
        }
        .resume()
    }
    // sorting the coins by their price changes in the last 24hrs
    func configureTopMovingCoins() {
        // top of the list will be the coin that changed the most in the last 24hrs
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(10))
    }
}
