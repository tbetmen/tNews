//
//  CarouselView.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Kingfisher
import SwiftUI

struct CarouselView: View {
    private let timer = Timer
        .publish(every: 5, on: .main, in: .common)
        .autoconnect()
    @Binding var trendingArticles: [Article]
    @State private var currentIndex = 0
    
    var body: some View {
        buildContentView()
    }
    
    @ViewBuilder
    private func buildContentView() -> some View {
        VStack(spacing: 16) {
            buildSliderView()
            buildIndicatorView()
        }
    }
    
    @ViewBuilder
    private func buildSliderView() -> some View {
        TabView(selection: $currentIndex) {
            ForEach(
                Array(trendingArticles.enumerated()),
                id: \.element.id
            ) { index, article in
                buildContentSliderView(article)
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 350)
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = currentIndex < trendingArticles.count ? currentIndex + 1 : 0
            }
        }
        .accessibilityIdentifier("tabView")
    }
    
    @ViewBuilder
    private func buildContentSliderView(_ article: Article) -> some View {
        NavigationLink(destination: {
            DetailScreen(article: article)
        }, label: {
            VStack {
                ThumbnailView(imageURL: article.imageURL)
                Text(article.title)
                    .font(.textMedium(size: 30))
                    .lineLimit(2)
                    .foregroundColor(Color.codGray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        })
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    private func buildIndicatorView() -> some View {
        HStack(spacing: 8) {
            ForEach(0..<trendingArticles.count, id: \.self) { index in
                Capsule()
                    .fill(Color.doveGray.opacity(currentIndex == index ? 1 : 0.2))
                    .frame(width: 32, height: 8)
                    .onTapGesture {
                        currentIndex = index
                    }
                    .accessibilityIdentifier("indicatorView")
            }
        }
    }
}

#Preview {
    CarouselView(trendingArticles: .constant([Article.dummy()]))
}
