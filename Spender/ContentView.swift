//
//  ContentView.swift
//  Spender
//
//  Created by Tenzin wangyal on 7/15/22.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var demoData: [Double] = [8,2,4,6,12,9,2]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK :- Title
                    Text("Overview")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    //MARK :- Chart
                    CardView {
                        VStack {
                        ChartLabel("$900", type: .title)
                        LineChart()
                        }
                            .background(Color.systemBackground) //the chart is not dynamic for darkmode so we have to manually fix it to work for darkmode as well
                    }
                    
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: [ColorGradient(.icon.opacity(0.4),.icon)]))
                .frame(height: 100)
                
                    
                    //MARK :- Recent Transaction List
                    //RecentTransactionList is a child of contentView and is dependent on the enviromentObject.To solve this we have to pass an instance of transactionListViewModel in preview.
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //MARK :- Notification icon
                ToolbarItem{
                    Image(systemName: "bell.badge.circle")
                       // .renderingMode(.original) //system color for bell
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .yellow)
                        
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary) //back button is defaulted to blue from xcode default accent color.
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
