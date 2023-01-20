//
//  ImageModel.swift
//  ServiceLocator
//
//  Created by artembolotov on 20.01.2023.
//

import Foundation
import SwiftUI

final class ImageModel: ObservableObject {
    @Injected private var imageLoaderService: ImageLoaderServiceProtocol
    
    @Published private(set) var image: Image?
    public func fetchImage(url: String) {
        imageLoaderService.loadImage(url: url) { image in
            self.image = image
        }
    }
}
