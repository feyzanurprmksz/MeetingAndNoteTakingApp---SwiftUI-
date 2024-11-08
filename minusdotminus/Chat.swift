//
//  Chat.swift
//  MeetingAndNoteTakingApp//
//  Created by Feyzanur Parmaksız on 30.10.2024.
//

import SwiftUI

struct Chat: View {
    var body: some View {
        NavigationView{
            ScrollView {
                ForEach(0..<10, id: \.self) { eleman in
                    VStack {
                        HStack (spacing: 16){
                            Image(systemName: "person.fill")
                                .font(.system(size: 40))
                                .background(Circle().fill(Color.gray))  // daire içine almak için kullanılır
 
                            VStack {
                                Text("@kullanıcı_adi")
                                Text("Mesaj")
                                    .foregroundColor(.gray)
                                
                                
                            }
                            
                         
                            Spacer()
                            Text("10dk")
                        }
                        Divider() //
                    }.padding(.horizontal)
                }
                
            }
            .navigationTitle("SOHBET")
            .bold()
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { // sağ üst köşeye yerleştirmek için kullanılır
                    Button(action: {
                        
                    }) {
                        Text("+")
                            .foregroundStyle(Color(red: 155/255, green: 89/255, blue: 182/255))
                            .font(.title)
                            .bold()
                        
                     
                        
                        
                    }
                }
            }
            
        }
        
    }
}
    

#Preview {
    Chat()
}
