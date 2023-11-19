//
//  DetailScreen.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel: DetailViewModel
    @State private var currentSlideshowIndex = 0
    
    var body: some View {
        buildContentView()
    }
    
    init(article: Article) {
        _viewModel = .init(wrappedValue: DetailViewModel(article: article))
    }
    
    @ViewBuilder
    private func buildContentView() -> some View {
        VStack(spacing: 16) {
            buildHeaderView()
            ScrollView {
                buildContentHeader()
                    .padding(.bottom, 32)
                buildSlideshowView()
                    .padding(.bottom, 32)
                buildNewsContentView()
                    .padding(.bottom, 32)
            }
        }
        .padding(.horizontal, 16)
        .ignoresSafeArea(.container, edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func buildHeaderView() -> some View {
        HStack(spacing: 16) {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(Color.codGray)
            })
            .accessibilityIdentifier("backButton")
            
            Text("tNews")
                .font(.textBlack(size: 40))
                .foregroundColor(Color.codGray)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
    
    @ViewBuilder
    private func buildContentHeader() -> some View {
        VStack {
            Group {
                Text(viewModel.article.title)
                    .font(.textMedium(size: 30))
                    .foregroundColor(Color.codGray)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .leading
                    )
                
                Text("by \(viewModel.article.contributor)")
                    .font(.textMedium(size: 16))
                    .foregroundColor(Color.doveGray)
                
                Text(viewModel.article.dateFormatted)
                    .font(.textLight(size: 12))
                    .foregroundColor(Color.codGray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    @ViewBuilder
    private func buildSlideshowView() -> some View {
        VStack(spacing: 16) {
            ThumbnailView(imageURL: viewModel.thumbnailURL)
                .frame(height: 250)
            
            if !viewModel.isSlideshowEmpty {
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(0..<viewModel.article.slideshow.count, id: \.self) { index in
                            Button(action: {
                                currentSlideshowIndex = index
                                viewModel.updateThumbnail(at: index)
                            }, label: {
                                ThumbnailView(imageURL: viewModel.article.slideshow[index])
                                    .frame(width: 75, height: 75)
                                    .opacity(currentSlideshowIndex == index ? 1 : 0.3)
                            })
                            .buttonStyle(.plain)
                            .accessibilityIdentifier("thumbnailOption")
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func buildNewsContentView() -> some View {
        Text(viewModel.article.content)
            .font(.textBook(size: 16))
            .foregroundColor(Color.codGray)
    }
}

#Preview {
    DetailScreen(article: Article.dummy())
}
