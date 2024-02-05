//
//  ContentView.swift
//  MyDarkModel
//
//  Created by iOSAwei on 2024/2/5.
//

import SwiftUI

struct ContentView: View {
        
    @EnvironmentObject var appearanceManager: AppearanceManager

    var body: some View {
        VStack() {
            List {
                
                switch appearanceManager.type {
                case .iSystem:
                    Text("跟随系统")
                case .iHight:
                    Text("浅色模式")
                case .iDark:
                    Text("暗黑模式")
                }
                
                Text("点我设置明亮模式").foregroundColor(Color("TextColor")).onTapGesture {
                    appearanceManager.type = .iHight
                }
                
                Text("点我设置暗黑模式").foregroundColor(Color("TextColor")).onTapGesture {
                    appearanceManager.type = .iDark
                }
                
                Text("点我设置跟随系统").foregroundColor(Color("TextColor")).onTapGesture {
                    appearanceManager.type = .iSystem
                }
                
                Image("darkImage")
                
            }
        }.onAppear {
            print("isDarkMode----->\(appearanceManager.isDarkMode)")
        }
    }
}
