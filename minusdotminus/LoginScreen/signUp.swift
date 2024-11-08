//
//  signUp.swift
//  MeetingAndNoteTakingApp
//
//  Created by Feyzanur Parmaksız on 14.10.2024.
//

import SwiftUI
import FirebaseAuth

struct signUp: View {
    

    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordagain: String = ""
    @State private var errorMessage: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateHome = false
    @State private var showPassword: Bool = false
    @State private var showPasswordAgain: Bool = false


    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                    Text("Kayıt Ol")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.bottom, 40)
                
               
                
                
                
                TextField("AD", text: $firstName)
                    .padding(10)
                    .background(Color(red: 240/255, green: 240/255 , blue: 240/255))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                TextField("SOYİSİM", text: $lastName)
                    .padding(10)
                    .background(Color(red: 240/255, green: 240/255 , blue: 240/255))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                TextField("KULLANICI ADI", text: $username)
                    .autocapitalization(.none)
                    .padding(10)
                    .background(Color(red: 240/255, green: 240/255 , blue: 240/255))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .textInputAutocapitalization(.none)
                    
                
                TextField("EMAİL", text: $email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .padding(10)
                    .background(Color(red: 240/255, green: 240/255 , blue: 240/255))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                // Şifre Alanı
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

                // Şifre Tekrar Alanı
                HStack {
                    if showPasswordAgain {
                        TextField("ŞİFRE TEKRAR", text: $passwordagain)
                            .autocapitalization(.none)
                            .padding(10)
                    } else {
                        SecureField("ŞİFRE TEKRAR", text: $passwordagain)
                            .autocapitalization(.none)
                            .padding(10)
                    }

                    Button(action: {
                        showPasswordAgain.toggle()
                    }) {
                        Image(systemName: showPasswordAgain ? "eye.fill" :"eye.slash.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }
                .background(Color(red: 240/255, green: 240/255 , blue: 240/255))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                
                
                Button(action: {
                    signUp()
                }) {
                    Text("KAYIT OL")
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
                        .cornerRadius(10)
                        .padding(.horizontal, 100)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Uyar!"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
            }
            .navigationDestination(isPresented: $navigateHome) {
                Menu()
                    .navigationBarBackButtonHidden(true)
            }

        }
    }

    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                self.alertMessage = "Hata oluştu, tekrar deneyiniz"
                self.showAlert.toggle()
            } else {
                navigateHome.toggle()
            }
        }
    }
    

    

    func isValidPassword(_ password: String) -> Bool {
        guard !password.contains(" ") else { return false }
        guard password.count >= 8 else { return false }
        
        let hasUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let hasLowercase = password.rangeOfCharacter(from: .lowercaseLetters) != nil
        let hasDigit = password.rangeOfCharacter(from: .decimalDigits) != nil
        let specialCharacters = CharacterSet.punctuationCharacters.union(.symbols)
        let hasSpecialCharacter = password.rangeOfCharacter(from: specialCharacters) != nil
        return hasUppercase && hasLowercase && hasDigit && hasSpecialCharacter
    }
    
    func emailFormatCheck() -> Bool {
        let validDomains = [".com", ".net", ".org", ".edu"]
        let emailFormat = self.email.split(separator: "@")
        
        if emailFormat.count == 2 {
            let domainPart = emailFormat[1]
            
            for domain in validDomains {
                if domainPart.hasSuffix(domain) {
                    return true
                }
            }
        }
        return false
    }
    
    func signUp() {
        if emailFormatCheck() {
            if password == passwordagain {
                if isValidPassword(password) {
                    register()
                } else {
                    alertMessage = "Şifre en az 1 büyük harf, 1 küçük harf, 1 rakam, 1 özel karakter içermeli ve en az 8 karakter uzunluğunda olmalı!"
                    showAlert.toggle()
                }
            } else {
                alertMessage = "Şifreler Uyuşmuyor!"
                showAlert.toggle()
            }
        } else {
            alertMessage = "Lütfen geçerli bir e-posta adresi girin!"
            showAlert.toggle()
        }
    }
}

#Preview {
    signUp()
}

