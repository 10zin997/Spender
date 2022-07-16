//
//  TransactionListViewModel.swift
//  Spender
//
//  Created by Tenzin wangyal on 7/15/22.
// https://designcode.io/data/transactions.json

import Foundation

//MARK :- ObservableObject is part of the Combine framework that turns any object into a publisher and will notify its subscribers of its state changes, so that they can refresh their view.
//MARK :- The property wrapper @Published is responsible for sending notifications to the subscribers whenever its value has changed.
final class TransactionListViewModel: ObservableObject{

    @Published var transaction: [Transaction] = []
    
    func getTransactions(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json")else{
            print("invalid URL")
         return
        }
        //MARK :- Use URL session data task to fetch data from api
        
    }
}

