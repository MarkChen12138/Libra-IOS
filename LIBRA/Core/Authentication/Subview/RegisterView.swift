//
//  RegisterView.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/8/26.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = SignInViewModel()
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    @Binding var isRegistrationSuccessful: Bool
    @Environment(\.presentationMode) var presentationMode // Access the presentation mode environment variable


    var body: some View {
        VStack {
            Text("Register")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Email")
                    .font(.headline)
                    .padding(.bottom, 8)
                TextField("", text: $viewModel.email)
                    .font(.body)
                    .padding(.bottom, 8)
                    .foregroundColor(.black)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray)
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Password")
                    .font(.headline)
                    .padding(.bottom, 8)
                SecureField("", text: $viewModel.password)
                    .font(.body)
                    .padding(.bottom, 8)
                    .foregroundColor(.black)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray)
            }
            .padding()
            
            Button("Register") {
                _ = AuthenticationManager.shared
                Task {
                    do {
                        try await viewModel.signUp()
                        isRegistrationSuccessful = true
                        self.presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("Registration failed: \(error.localizedDescription)")
                        alertMessage = "Registration failed: \(error.localizedDescription)"
                        isAlertPresented = true
                    }
                }
            }
            .buttonStyle(RegisterButtonStyle())
            .frame(maxWidth: .infinity)

            Spacer()

        }
        .padding()
    }
}

struct RegisterButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color("LibraGreen"))
            .cornerRadius(10)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isRegistrationSuccessful: .constant(false) )
    }
}
