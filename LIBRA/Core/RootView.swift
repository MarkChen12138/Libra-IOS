//
//  RootView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/10.
//

import Foundation
import SwiftUI

struct RootView: View {

    @State private var showSignInView: Bool = false

    var body: some View {
        ZStack {
            if !showSignInView {
                TabbarView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
               StartPageView(showStartPageView: $showSignInView)
            }
        }
    }
}


struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
