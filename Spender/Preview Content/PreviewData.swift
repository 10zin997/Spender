//
//  PreviewData.swift
//  Spender
//
//  Created by Tenzin wangyal on 7/15/22.
//

import Foundation

var transactionPreviewData = Transaction(id: 1, date: "1/01/2010", institution: "CUNY", account: "CUNY Fund", merchant: "Brooklyn College", amount: 420.69, type: "debit", categoryId: 213, category: "CompSci Fund", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10 )
