//
//  ImageLoaderService.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//

import SwiftUI
import ImageLoader

protocol ImageLoaderServiceProtocol {
    func loadImage(url: String, completion: @escaping ((Image) -> Void))
}

final class ImageLoaderService: ImageLoaderServiceProtocol {
    
    @Injected private var imageLoader: ImageLoaderProtocol
    
    func loadImage(url: String, completion: @escaping ((Image) -> Void)) {
        imageLoader.loadImage(url: url, completion: completion)
    }
}
