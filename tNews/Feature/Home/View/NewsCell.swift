//
//  NewsCell.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Kingfisher
import SwiftUI

struct NewsCell: View {
    var article: Article
    
    var body: some View {
        buildContentView()
    }
    
    @ViewBuilder
    private func buildContentView() -> some View {
        HStack(spacing: 16) {
            ThumbnailView(imageURL: article.imageURL)
                .frame(width: 150, height: 150)
            
            VStack {
                Text(article.title)
                    .font(.textMedium(size: 30))
                    .foregroundColor(Color.codGray)
                    .multilineTextAlignment(.leading)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .leading
                    )
                HStack {
                    Text(article.dateTimeLapse)
                        .font(.textLight(size: 12))
                        .foregroundColor(Color.codGray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Read more")
                        .font(.textHeavy(size: 14))
                        .foregroundColor(Color.doveGray)
                        .underline()
                }
            }
        }
        .frame(height: 150)
    }
}

#Preview {
    VStack(spacing: 16) {
        NewsCell(article: Article.dummy())
        NewsCell(article: Article.dummy())
    }
    .padding(16)
}
