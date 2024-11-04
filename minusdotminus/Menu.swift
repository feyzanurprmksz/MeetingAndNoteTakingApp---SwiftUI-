//
//  Menu.swift
//  MeetingAndNoteTakingApp
//
//  Created by Feyzanur Parmaksız on 30.10.2024.
//

import SwiftUI

struct Menu: View {
    @State private var navigateProfile = false
    @State private var navigateChat = false
    @State private var navigateCalendar = false
    @State private var navigateNotes = false
    @State private var navigateProjectManagement = false
    @State private var navigateAppConnections = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Button(action: {
                            navigateChat.toggle()
                        }) {
                            Text("Sohbet")
                                .foregroundColor(.gray)
                                .padding()
                                .background(Color(red: 237/255, green: 223/255, blue: 236/255))
                                .cornerRadius(15)
                        }
                        .navigationDestination(isPresented: $navigateChat) {
                            Chat()
                        }
                        
                        Button(action: {
                            navigateCalendar.toggle()
                        }) {
                            Text("Takvim")
                                .foregroundColor(.gray)
                                .padding()
                                .background(Color(red: 237/255, green: 223/255, blue: 236/255))
                                .cornerRadius(15)
                        }
                        .navigationDestination(isPresented: $navigateCalendar) {
                            Calendar()
                        }
                        
                        Button(action: {
                            navigateNotes.toggle()
                        }) {
                            Text("Notlar")
                                .foregroundColor(.gray)
                                .padding()
                                .background(Color(red: 237/255, green: 223/255, blue: 236/255))
                                .cornerRadius(15)
                        }
                        .navigationDestination(isPresented: $navigateNotes) {
                            Notes()
                        }
                        
                        Button(action: {
                            navigateProjectManagement.toggle()
                        }) {
                            Text("Proje Yönetimi")
                                .foregroundColor(.gray)
                                .padding()
                                .background(Color(red: 237/255, green: 223/255, blue: 236/255))
                                .cornerRadius(15)
                        }
                        .navigationDestination(isPresented: $navigateProjectManagement) {
                            ProjectManagemen()
                        }
                        
                        Button(action: {
                            navigateAppConnections.toggle()
                        }) {
                            Text("Uygulama Bağlama")
                                .foregroundColor(.gray)
                                .padding()
                                .background(Color(red: 237/255, green: 223/255, blue: 236/255))
                                .cornerRadius(15)
                        }
                        .navigationDestination(isPresented: $navigateAppConnections) {
                            AppConnections()
                        }
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                   
                    Button(action: {
                        navigateProfile.toggle()
                    }) {
                        Text("Profil")
                            .foregroundColor(.gray)
                            .padding()
                            .background(Color(red: 237/255, green: 223/255, blue: 236/255))
                            .cornerRadius(15)
                    }
                    .navigationDestination(isPresented: $navigateProfile) {
                        Profile()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 250)
                }
                
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                        Text("Menü")
                        .font(.largeTitle)
                        .bold()
                    }
            }

        }
    }
}

#Preview {
    Menu()
}
