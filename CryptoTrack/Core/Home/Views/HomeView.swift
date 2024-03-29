//
//  HomeView.swift
//  CryptoTrack
//
//  Created by Denis DRAGAN on 30.11.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var vm: HomeViewModel
    @State private var showPortfolio = false // Animate right
    @State private var showPortfolioView = false // Open sheet
    
    var body: some View {
        ZStack {
            // Background Layer
            Color.theme.background
                .ignoresSafeArea()
            
            // Content Layer
            VStack {
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                
                columnTitles
                
                if !showPortfolio {
                    allCoinsList
                    .transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList
                    .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $showPortfolioView, content: {
                PortfolioView()
            })
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
    .environmentObject(HomeViewModel())
}

extension HomeView {
    private var homeHeader : some View {
        HStack {
            // Left BarButton
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .background(
                    CircleButtonAnimationView(animete: $showPortfolio)
                )
                .onTapGesture {
                    // When showPortfolio is true and icon is plus
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
            Spacer()
            // Header Text
            Text(showPortfolio ? "Portfolio" :"Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none, value: showPortfolio)
            Spacer()
            // Right BarButton
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            Button(action: {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            }, label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
}
