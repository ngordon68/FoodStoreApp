//
//  SignInView.swift
//  GreenDream
//
//  Created by Nick Gordon on 10/6/22.
//

import SwiftUI


struct SignInView: View {
    
    @State var username = ""
    @State var password = ""
    @State var isLoggedIn = false
    @State var wrongInfo = ""
    var userInputUsername = "Ngordon"
    var userInputPassword = "test123"
    @State var loginAttempts = 3
    @State var isLoading = false
    @State var isLoadingFail = false
    @State var wrongUserName = 0
    @State var wrongPassword = 0
    
    func authenticUser (username: String, password: String) {
        if loginAttempts > 0 {
            if username == userInputUsername {
                if password == userInputPassword {
                    
                    isLoading = true
                }
            }
            else {
                isLoadingFail = true
                
                loginAttempts -= 1
                
            }
        }
        else {
            wrongInfo = "you ran out of attempts, please try again in 5 minutes"
        }
    }
    var body: some View {
        if isLoggedIn == true {
            PaymentView()
            
        }
        else {
            NavigationView {
                ZStack {
                    Color.green
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.8)
                        .foregroundColor(.white.opacity(0.15))
                    Circle()
                        .scale(1.2)
                        .foregroundColor(.white)
                    
                    VStack {
                        Image(systemName: "person.3")
                            .imageScale(.large)
                            .foregroundColor(.green)
                            .font(.system(size: 60))
                            .padding(.bottom, 40)
                        
                        
                        TextField("Username", text: $username)
                            .padding()
                            .frame(width: 300, height:50 )
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(15)
                            .border(.red, width: CGFloat(wrongUserName))
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height:50 )
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(15)
                            .border(.red, width: CGFloat(wrongPassword))
                        
                        
                        Button("Login") {
                            authenticUser(username: username, password: password)
                            
                        }
                        .foregroundColor(.black)
                        .font(.headline)
                        .frame(width: 300, height:50 )
                        .background(Color.green)
                        .cornerRadius(15)
                        
                        
                        Text(wrongInfo)
                            .foregroundColor(.red)
                            .bold()
                        
                        HStack {
                            
                            Text("Forgot username?")
                                .padding(.trailing, 45)
                            Text("Forgot password?")
                        }
                        .foregroundColor(.blue)
                        .padding()
                        
                        if isLoading == true {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .scaleEffect(3)
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation{
                                            self.isLoading = false
                                            self.isLoggedIn = true
                                        }
                                    }
                                }
                        } else if isLoadingFail == true {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .scaleEffect(3)
                                .onAppear() {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        withAnimation{
                                            self.isLoadingFail = false
                                            self.wrongInfo = "Please re enter your username and password. \n You have \(loginAttempts)  attempts left"
                                            wrongPassword = 2
                                            wrongUserName = 2
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
