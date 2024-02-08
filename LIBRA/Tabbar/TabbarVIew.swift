//
//  TabbarVIew.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/10.
//

import Foundation
import SwiftUI

struct TabbarView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            CustomNavigationBar() // 添加自定义导航栏
            TabView {
                NavigationStack {
                    HomePageView()
                }
                .tabItem {
                    Image(systemName: "cart")
                    Text("交易")
                }
                
                NavigationStack {
                    ContractView()
                }
                .tabItem {
                    Image(systemName: "pencil.circle.fill")
                    Text("求求你让我生成个pdf")
                }
                NavigationStack {
                    ProductsView()
                }
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("市场")
                }
                
                NavigationStack {
                    ProfileView(showSignInView: $showSignInView)
                }
                .tabItem {
                    Image(systemName: "person")
                    Text("个人信息")
                }
            }
        }
    }
}


struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView(showSignInView: .constant(false))
    }
}

