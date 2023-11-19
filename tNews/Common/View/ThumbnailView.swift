//
//  ThumbnailView.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Kingfisher
import SwiftUI

struct ThumbnailView: View {
    var imageURL: String
    
    var body: some View {
        KFImage.url(URL(string: imageURL))
            .resizable()
            .placeholder {
                ZStack {
                    Color.clear
                    Text("thumbnail")
                        .font(.textMedium(size: 30))
                        .foregroundColor(Color.codGray.opacity(0.5))
                }
            }
            .background(Color.codGray.opacity(0.1))
    }
}

#Preview {
    VStack {
        Group {
            ThumbnailView(imageURL: "https://loremflickr.com/640/480")
            ThumbnailView(imageURL: "")
        }
        .frame(width: 200, height: 200)
    }
}
