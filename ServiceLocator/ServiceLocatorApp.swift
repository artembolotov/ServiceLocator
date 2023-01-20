//
//  ServiceLocatorApp.swift
//  ServiceLocator
//
//  Created by artembolotov on 19.01.2023.
//

import SwiftUI

@main
struct ServiceLocatorApp: App {
    init() {
        Configurator.shared.setup()
    }
    
    var body: some Scene {
        WindowGroup {
            NewsScreen()
        }
    }
}
