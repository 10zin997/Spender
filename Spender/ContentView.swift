//
//  ContentView.swift
//  Spender
//
//  Created by Tenzin wangyal on 7/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    //MARK :- Title
                    Text("Overview")
                        .font(.title)
                        .fontWeight(.bold)
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
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
