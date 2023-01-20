//
//  Extensions.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//

public extension Article {
    var publishedAtPrettyDate: String? {
        guard let published = self.publishedAt,
              let date = OpenISO8601DateFormatter().date(from: published) else { return nil }
                
        return Common.prettyDateFormatter.string(from: date)
    }
}
