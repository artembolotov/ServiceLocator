//
//  ServiceLocator.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//

import Foundation

final class ServiceLocator {
    public static let shared = ServiceLocator()
    
    private lazy var services = [String: Any]()
    
    func addService<T>(service: T) {
        let key = String(describing: T.self)
        services[key] = service
    }
    
    func getService<T>() -> T? {
        let key = String(describing: T.self)
        return services[key] as? T
    }
}
