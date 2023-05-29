//
//  ContentView.swift
//  BarcodeScanner
//
//  Created by Kübra Cennet Yavaşoğlu on 28.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: AppViewModel
    
    var body: some View {
        switch vm.dataScannerAccessStatus {
        case.scannerAvailable:
            mainView
        case.cameraNotAvailable:
            Text("Your device doesn't have a camera")
        case.scannerNotAvailable:
            Text("Your device doesn't have support for scanning barcode with this app")
        case.cameraAccessNotGranted:
            Text("Please provide access to the camera in settings")
        case.notDetermined:
            Text("Requesting camera access")
        }
    }
    
    private var mainView: some View {
        DataScannerView(recognizedItems: $vm.recognizedItems,
                        recognizedDataType: vm.recognizedDataType,
                        recognizesMultipleItems: vm.recognizesMultipleItems)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
