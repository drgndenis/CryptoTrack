//
//  PortfolioImageView.swift
//  CryptoTrack
//
//  Created by Denis DRAGAN on 20.12.2023.
//

import SwiftUI

struct PortfolioCoinImageView: View {
    let coin: CoinModel
    
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

struct PortfolioCoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioCoinImageView(coin: dev.coin)
    }
}
