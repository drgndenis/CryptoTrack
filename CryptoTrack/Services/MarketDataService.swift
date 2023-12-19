//
//  MarketDataService.swift
//  CryptoTrack
//
//  Created by Denis DRAGAN on 19.12.2023.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: DataClass? = nil
    private var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global")
        else { return }
        
        marketDataSubscription = NetworkManager.download(url: url)
            .decode(type: MarketDataModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedMarketData) in
                self?.marketData = returnedMarketData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
