//
//  ContentMainUIView.swift
//  MyDarkModel
//
//  Created by Peoit-czw on 2024/2/5.
//

import SwiftUI

struct ContentMainUIView: View {
    
    @State private var selectedTab = 0
    
    @EnvironmentObject var appearanceManager: AppearanceManager
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView()
                .tag(0)
            
            ContentView()
                .tag(1)
            
            ContentView()
                .tag(2)
            
        }.edgesIgnoringSafeArea(.bottom)
        .overlay(
            CustomTabBar(selectedTab: $selectedTab)
                .frame(maxWidth: .infinity,maxHeight: 40)
                .background(appearanceManager.isDarkMode ? Color.black:Color.orange),alignment: .bottom
        )
    }
}

struct CustomTabBar: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                selectedTab = 0
            }) {
                Image(systemName: "1.circle")
                    .foregroundColor(selectedTab == 0 ? .blue : .gray)
            }.frame(maxWidth: .infinity)
            
            Button(action: {
                selectedTab = 1
            }) {
                Image(systemName: "2.circle")
                    .foregroundColor(selectedTab == 1 ? .blue : .gray)
            }.frame(maxWidth: .infinity)
            
            Button(action: {
                selectedTab = 2
            }) {
                Image(systemName: "3.circle")
                    .foregroundColor(selectedTab == 2 ? .blue : .gray)
            }.frame(maxWidth: .infinity)
        }
        .font(.system(size: 24))
    }
}
