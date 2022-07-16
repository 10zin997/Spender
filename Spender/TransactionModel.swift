//
//  TransactionModel.swift
//  Spender
//
//  Created by Tenzin wangyal on 7/15/22.
//

import Foundation

struct Transaction: Identifiable{
    
    let id: Int
    let date: String
    let instituition: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    let isTransfer: Bool
    let isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date{
        date.dateParsed()
    }
    //MARK :- show negative or postive balance.
    var negorPosAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}

enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}
