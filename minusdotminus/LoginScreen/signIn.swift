//
//  signIn.swift
//  MeetingAndNoteTakingApp
//
//  Created by Feyzanur Parmaksız on 14.10.2024.
//

import SwiftUI
import FirebaseAuth

struct signIn: View {

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateHome = false
    @State private var navigateSignUp = false
    @State private var showPassword: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                
                Text("Giriş Yap")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.bottom, 40)
                       
                
                    
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .textInputAutocapitalization(.never)
                        .padding(10)
                        .background(Color(red: 240/255, green: 240/255 , blue: 240/255))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    
                HStack {
                    if showPassword {
                        TextField("ŞİFRE", text: $password)
                            .textInputAutocapitalization(.never)
                            .textContentType(.password)
                            .padding(10)
                    } else {
                        SecureField("ŞİFRE", text: $password)
                            .autocapitalization(.none)
                            .textContentType(.password)
                            .padding(10)
                    }

                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.fill" :"eye.slash.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }
                .background(Color(red: 240/255, green: 240/255 , blue: 240/255))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
                NavigationLink(destination: signUp()) {
                                    Text("Hesabınız yok mu?")
                                        .foregroundColor(.blue)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }

                
                    
                    Button(action: {
                        print("Login butonuna tıklandı")
                        login()
                    }) {
                        Text("GİRİŞ YAP")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .background(
                                LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 155/255, green: 89/255, blue: 182/255), // Parlak Mor
                                    Color(red: 0/255, green: 168/255, blue: 255/255)    // Neon Mavi
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .cornerRadius(15)
                            .padding(.horizontal, 100)
                    }
                    .padding(.top, 5)
                    

                    .navigationDestination(isPresented: $navigateHome) {
                        Menu()
                            .navigationBarBackButtonHidden(true)
                    }
                
                
                }
            
 
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Hata!"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("Tamam"))
                )
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                self.alertMessage = error.localizedDescription  
                self.showAlert.toggle()
            } else {
                print("Giriş başarılı!")
                navigateHome.toggle()
            }
        }
    }
  
}

#Preview {
    signIn()
}



