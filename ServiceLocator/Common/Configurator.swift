//
//  Configurator.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//


import Foundation
import ApiManager
import ImageLoader

final class Configurator {
    static let shared = Configurator()
    
    private init() {}
    
    func setup() {
        setupApiManager()
        setupNewsNetworkService()
        registerImageLoader()
        registerImageLoaderService()
    }
    
    private func setupApiManager() {
        let apiManager: ApiManagerProtocol = ApiManager.shared
        ServiceLocator.shared.addService(service: apiManager)
    }
    
    private func setupNewsNetworkService() {
        let newsNetworkService: NewsNetworkServiceProtocol = NewsNetworkService()
        ServiceLocator.shared.addService(service: newsNetworkService)
    }
    
    private func registerImageLoader() {
        let imageLoader: ImageLoaderProtocol = ImageLoader.shared
        ServiceLocator.shared.addService(service: imageLoader)
    }
    
    private func registerImageLoaderService() {
        let imageLoaderService: ImageLoaderServiceProtocol = ImageLoaderService()
        ServiceLocator.shared.addService(service: imageLoaderService)
    }
}
