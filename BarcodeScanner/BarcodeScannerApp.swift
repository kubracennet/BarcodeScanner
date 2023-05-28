//
//  BarcodeScannerApp.swift
//  BarcodeScanner
//
//  Created by Kübra Cennet Yavaşoğlu on 28.05.2023.
//

import SwiftUI

@main
struct BarcodeScannerApp: App {
    
    @StateObject private var vm = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .task {
                    await vm.requestDataScannerAccessStatus()
                }
        }
    }
}
