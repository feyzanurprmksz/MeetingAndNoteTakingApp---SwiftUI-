//
//  Profile.swift
//  MeetingAndNoteTakingApp
//
//  Created by Feyzanur Parmaksız on 30.10.2024.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack(spacing: 16) {

            HStack(spacing: 16) {

                Button {
                   
                } label: {
                    Image(systemName: "person.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.black)
                        .padding(20)
                        .background(Circle().fill(Color.gray)) // daire içine almak için
                }
                

                VStack(alignment: .leading) {
                    Text("İsim Soyisim")
                        .font(.title2)
                        .bold()
                    Text("@kullanici_adi")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
            }
            

            Text("Bu alan biyografi içindir.")
                .font(.body)
                .multilineTextAlignment(.center)  // Uzun metinlerde hizalama kısmı
                .padding(10)


            HStack(spacing: 40) {
                VStack {
                    Text("Takipçiler")
                        .font(.subheadline)
                    Text("972")
                        .font(.headline)
                }
                
                VStack {
                    Text("Takip Edilenler")
                        .font(.subheadline)
                    Text("171")
                        .font(.headline)
                }
            }


            Button(action: {
                
            }) {
                Text("Profili Düzenle")
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
                        )
                    )
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top, 100)
    }
}

#Preview {
    Profile()
}

