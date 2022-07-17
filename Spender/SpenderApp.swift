//
//  SpenderApp.swift
//  Spender
//
//  Created by Tenzin wangyal on 7/15/22.
//

import SwiftUI

@main
struct SpenderApp: App {
   @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
