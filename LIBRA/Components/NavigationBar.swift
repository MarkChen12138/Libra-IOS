//
//  NavigationViewModel.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/9/5.
//

import Foundation
import SwiftUI

struct CustomNavigationBar: View {
    var body: some View {
        HStack {
            Button(action: {
                // Handle settings button tap
            }) {
                Image(systemName: "gear")
                    .foregroundColor(.black)
                    .padding(.top, 15)
            }
            Spacer()
            Image("libra")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.top, 45)
            Spacer()
            NavigationLink(destination: ProfileView(showSignInView:.constant(true))) {
                Image(systemName: "ellipsis.message")
                    .foregroundColor(.black)
                    .padding(.top, 25)
            }
        }
        .padding()
        .frame(width: 370, height: 50)
    }
}

struct NavigationBarPreviews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}



