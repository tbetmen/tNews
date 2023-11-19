//
//  Article.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation

struct Article: Identifiable {
    var id: String
    var imageURL: String
    var title: String
    var date: String
    var contributor: String
    var content: String
    var slideshow = [String]()
    
    var dateTimeLapse: String {
        date.getDateTimeLapse(dateFormatter: getFormatter())
    }
    var dateFormatted: String {
        date.getDateArticle(dateFormatter: getFormatter())
    }
    
    private func getFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ID")
        return formatter
    }
}

extension Article {
    public static func dummy() -> Article {
        Article(
            id: "1",
            imageURL: "https://loremflickr.com/640/480",
            title: "perspiciatis maxime molestiae",
            date: "a minutes ago",
            contributor: "Lois Lane",
            content: "Esse iure quis a eligendi dolor ab quam soluta ipsam. Pariatur aliquam quibusdam ratione. Velit consequuntur voluptatibus assumenda corporis. Perspiciatis deleniti consectetur a quia modi doloremque harum. Libero repellendus qui et impedit laborum veritatis delectus.\nEos soluta architecto occaecati beatae suscipit tenetur eum eveniet harum. Corporis iusto et officiis veniam delectus. Dolorum suscipit unde eveniet explicabo porro ratione similique.\nConsequuntur vitae totam quasi non tempore quam omnis dolorem. Assumenda reprehenderit perferendis quis et similique maiores quo. Corrupti temporibus quia. Dolor atque consequatur mollitia corporis quis. Numquam adipisci dolorem. Officiis accusantium at iusto mollitia distinctio."
        )
    }
}
