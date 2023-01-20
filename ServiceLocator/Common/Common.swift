//
//  Common.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//

import Foundation

struct Common {
    static let prettyDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}
