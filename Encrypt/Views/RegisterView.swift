//
//  RegisterView.swift
//  Encrypt
//
//  Created by Justin Klaußnitzer on 09.11.21.
//

import SwiftUI

struct RegisterView: View {
    @State private var popOverPassword: Bool = false
    @State private var userPassword: String = ""
    @State private var userRepeatPassword: String = ""
    
    var body: some View {
        VStack {
            Text("Encrypt").bold().font(.system(size: 60)).padding(.top, 50)
            Spacer()
            
            VStack {
                Text("Seems like you've never used this app before. Let's get started by choosing a safe password that you can remember!").bold()
                
                Button("What is a safe password?", action: {
                    self.popOverPassword = true
                }).padding(.top, 5).popover(isPresented: self.$popOverPassword, arrowEdge: .bottom) {
                    SafePasswordView()
                }
            }.padding(.horizontal, 20)
            
            VStack {
                SecureField("Password", text: $userPassword).textFieldStyle(.roundedBorder)
                
                SecureField("Repeat Password", text: $userRepeatPassword).textFieldStyle(.roundedBorder)
            }.padding(30)
            
            Spacer()
            Spacer()
        }
        
    }
}

struct SafePasswordView: View {
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("Safe password").bold().font(.system(size: 30)).padding(.top, 20)
            Spacer()
            
            Text("A safe password is hard to predict and should contain at least 15 - 20 characters. We would recommend using a combination of random words, which are randomly cased and are seperated by numbers or special characters. This makes them safe and easier to remember.").padding(.horizontal, 20);
            
            VStack(alignment: .leading) {
                Text("Example:").bold().padding(.bottom, 5)
                Text("cow.Houses!play3quarter,President").foregroundColor(.green)
                
            }.padding(.top, 30)
            
            Button("Close") {
                self.presentationMode.wrappedValue.dismiss()
            }.padding(.top, 50)
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
