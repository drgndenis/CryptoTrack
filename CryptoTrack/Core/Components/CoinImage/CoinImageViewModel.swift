//
//  CoinImageViewModel.swift
//  CryptoTrack
//
//  Created by Denis DRAGAN on 8.12.2023.
//

import Foundation
import SwiftUI
import Combine


class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let imageService: CoinImageService
    private let coin: CoinModel
    private var cancellables = Set<AnyCancellable>()
    
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageService = CoinImageService(coin: coin)
        self.isLoading = true
        addSubscribers()
    }
    
    private func addSubscribers() {
        imageService.$image
            .sink { _ in
                self.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
