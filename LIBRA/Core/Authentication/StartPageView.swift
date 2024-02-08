//
//  LoginView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/8/25.
//

import SwiftUI


struct StartPageView: View {
    
    @Binding var showStartPageView: Bool

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image("libra")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 100, height: 250)
                .padding()
            
            Spacer()
            
            NavigationLink{
                LoginView()
            }label: {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("LibraGreen").cornerRadius(10))
                    .padding(.horizontal, 40)
            }
            
            NavigationLink{
                RegisterView(isRegistrationSuccessful: .constant(false) )
            }label: {
                Text("Register")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("LibraGreen").cornerRadius(10))
                    .padding(.horizontal, 40)
            }
            
            Button("Guest Login") {
                showStartPageView = false // Update the binding
            }
            .buttonStyle(GuestButtonStyle())
            
            Spacer().frame(height: 10)
        }
    }
}


struct LoginButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("LibraGreen").cornerRadius(10))
            .padding(.horizontal, 40)
    }
}

struct GuestButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("LibraMediumGray").cornerRadius(10))
            .padding(.horizontal, 40)
    }
}

struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView(showStartPageView: .constant(false))
    }
}
