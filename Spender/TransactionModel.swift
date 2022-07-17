//
//  TransactionModel.swift
//  Spender
//
//  Created by Tenzin wangyal on 7/15/22.
//

import Foundation
import SwiftUIFontIcon


struct Transaction: Identifiable, Decodable, Hashable{
    
    let id: Int
    let date: String
    let institution: String
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
//MARK :- The computed property is stored here and not a seprate file TransactionViewModel is because there is nothing to fetch and no functions to call.
    var icon : FontAwesomeCode{
        if let category = Category.all.first(where: { $0.id == categoryId}){
            return category.icon
        }
        //MARK :- question icon
        return .question
    }
    
    var dateParsed: Date{
        date.dateParsed()
    }
    //MARK :- show negative or postive balance.
    var negorPosAmount: Double{
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    var month: String{
        dateParsed.formatted(.dateTime.year().month(.wide)) //.wide will show full month title
    }
}

enum TransactionType: String{
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
}

extension Category{
    //MARK :- Main Category
    static let autoAndTransport = Category(id: 1, name:"Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name:"Entertainment", icon:.film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name:"Food & Dining", icon:.hamburger)
    static let home = Category(id: 6, name:"Home", icon:.home)
    static let income = Category(id:7,name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)
    
    //MARK :- Sub-Category
    //Category (id) numbers follows the mainCateogoryId number
    static let publicTransportation = Category(id: 101, name: "Public Transportathin", icon: .bus,mainCategoryId: 1)
    static let taxi = Category(id: 102, name:"Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name:"Mobile Phone", icon: .mobile_alt, mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name:"Movies & DVDs", icon: .film, mainCategoryId: 3)
    static let bankFee = Category(id: 401, name:"Bank Fee", icon: .hand_holding_usd, mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name:"Finance Charge", icon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurants = Category(id: 502, name:"Restaurants", icon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent",icon: .house_user, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name:"Home Supplies", icon:.lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name:"Paycheque", icon:.dollar_sign, mainCategoryId: 7)
    static let software = Category(id: 801, name:"Software", icon: .icons, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon:.exchange_alt, mainCategoryId:9)
}
//MARK :- advangage of separating is that we can call them independently
extension Category{
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    //MARK :- combine both of the catigores into one Array
    static let all:[Category] = categories + subCategories
}
