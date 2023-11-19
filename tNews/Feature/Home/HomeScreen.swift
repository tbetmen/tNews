//
//  HomeScreen.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel: HomeViewModel
    
    var body: some View {
        buildContentView()
            .onAppear(perform: viewModel.loadData)
    }
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    @ViewBuilder
    private func buildContentView() -> some View {
        VStack(spacing: 16) {
            buildHeaderView()
            ScrollView {
                switch viewModel.contentState {
                case .loaded:
                    CarouselView(
                        trendingArticles: $viewModel.trendingArticles
                    )
                    .padding(.bottom, 32)
                    buildLatestNewsView()
                case .loading:
                    buildSkeletonView()
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 32)
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.container, edges: .bottom)
    }
    
    @ViewBuilder
    private func buildSkeletonView() -> some View {
        VStack(spacing: 0) {
            Shimmer()
                .frame(height: 250)
                .padding(.bottom, 32)

            Shimmer()
                .frame(width: 200, height: 32)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 8)

            Shimmer()
                .frame(height: 32)
                .padding(.bottom, 16)

            Shimmer()
                .frame(width: 120, height: 8)
                .padding(.bottom, 32)
            
            Shimmer()
                .frame(width: 200, height: 32)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 32)
            
            ForEach(0..<3, id: \.self) { _ in
                HStack(spacing: 16) {
                    Shimmer()
                        .frame(width: 150, height: 150)
                    
                    VStack {
                        Shimmer()
                            .frame(height: 32)
                        Shimmer()
                            .frame(height: 32)
                        Shimmer()
                            .frame(height: 32)
                            .padding(.trailing, 32)
                        Spacer()
                        HStack {
                            Shimmer()
                                .frame(height: 16)
                            Shimmer()
                                .frame(height: 16)
                        }
                    }
                }
                .padding(.bottom, 32)
            }
        }
    }
    
    @ViewBuilder
    private func buildHeaderView() -> some View {
        Text("tNews")
            .font(.textBlack(size: 40))
            .foregroundColor(Color.codGray)
    }
    
    @ViewBuilder
    private func buildLatestNewsView() -> some View {
        VStack(spacing: 32) {
            Text("Latest News")
                .font(.textHeavy(size: 28))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(viewModel.articles) { article in
                NavigationLink(destination: {
                    DetailScreen(article: article)
                }, label: {
                    NewsCell(article: article)
                })
                .buttonStyle(.plain)
            }
        }
        .accessibilityIdentifier("latestNews")
    }
}

#Preview {
    HomeScreen()
}
