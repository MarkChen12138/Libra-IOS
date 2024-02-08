//
//  LoginView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/8/27.
//
import SwiftUI

struct LoginView: View {
    @AppStorage("savedEmail") private var savedEmail = ""
    @StateObject private var viewModel = SignInViewModel()
    @State private var emailOrPhone = ""
    @State private var password = ""
    @State private var showText = false
    @State private var isEditViewPresented = false
    @State private var loginError: Error?

    var body: some View {
        
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Account Number")
                        .font(.headline)
                        .padding(.bottom, 8)
                    TextField("", text: $viewModel.email)
                        .font(.body)
                        .padding(.bottom, 8)
                        .foregroundColor(.black)
                        .onAppear {
                            emailOrPhone = savedEmail
                        }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray)
                }
                .padding()

                VStack(alignment: .leading, spacing: 0) {
                    Text("Password")
                        .font(.headline)
                        .padding(.bottom, 8) // Add spacing above the title
                    SecureField("", text: $viewModel.password)
                        .font(.body)
                        .padding(.bottom, 8) // Adjust spacing between input and underline
                        .foregroundColor(.black)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray)
                }
                .padding()

                Button("Log In") {
                    print("Button clicked!")
                    Task {
                        do {
                            try await viewModel.signIn()
                            print("Login successful!")
                            isEditViewPresented = true
                        } catch {
                            print("Login error: \(error.localizedDescription)")
                            loginError = error // 存储登录错误以供后续使用
                            showText = true // 设置为 true，以显示错误文本
                        }
                    }
                }
                .buttonStyle(LoginButtonStyle1())
                .frame(maxWidth: .infinity)

                if showText {
                    Text("Button was pressed!")
                        .font(.headline)
                        .padding()
                }

                if let error = loginError {
                    Text("Login error: \(error.localizedDescription)")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }

                Spacer()
            }
            .fullScreenCover(isPresented: $isEditViewPresented){
                NavigationStack{
                    TabbarView(showSignInView: $isEditViewPresented)
                }
            }
            .padding()
            
        }
    }


struct LoginButtonStyle1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color("LibraGreen"))
            .cornerRadius(10)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
