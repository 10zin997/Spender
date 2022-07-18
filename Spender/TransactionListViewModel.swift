//
//  TransactionListViewModel.swift
//  Spender
//
//  Created by Tenzin wangyal on 7/15/22.
// https://designcode.io/data/transactions.json

import Foundation
import Combine
import Collections //to use OrderedDictionary, wwdc 2021 collection library

//MARK :- since dictionary is unordered we to need to make it ordered so that the app is consistent.
typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String,Double)] //string is date, double is the amount
//MARK :- ObservableObject is part of the Combine framework that turns any object into a publisher and will notify its subscribers of its state changes, so that they can refresh their view.
//MARK :- The property wrapper @Published is responsible for sending notifications to the subscribers whenever its value has changed.
final class TransactionListViewModel: ObservableObject{
    
    @Published var transactions : [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
    
    func getTransactions(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json")else{
            print("invalid URL")
            return
        }
        //MARK :- Use URL session data task to fetch data from api
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{ (data,response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    print("failure to complete transaction", error.localizedDescription)
                case .finished:
                    print("finished fetching transaction")
                }
                //MARK :- @weak prevents memory leak  as it will release self from memory when necessary
            }receiveValue: { [weak self] result in
                self?.transactions = result
                //dump(self?.transactions) to see the output in log
            }
            .store(in: &cancellables)
    }
    func groupTransactionsByMonth() -> TransactionGroup{
        guard !transactions.isEmpty else { return [:] }
        
        let groupedTransactions = TransactionGroup(grouping: transactions){$0.month}
        return groupedTransactions
    }
    func accumulateTransactions() -> TransactionPrefixSum{
        print("accumulateTransactions")
        guard !transactions.isEmpty else { return []}
        
        let today = "07/18/2022".dateParsed()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval", dateInterval)
       
        var sum: Double = .zero
        var cummulativeSum = TransactionPrefixSum()
        
    }
}

