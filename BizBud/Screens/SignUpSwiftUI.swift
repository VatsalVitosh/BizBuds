//
//  SignUpSwiftUI.swift
//  BizBud
//
//  Created by Shielda Hidajat on 09/06/23.
//

import Foundation
import SwiftUI

struct Sign_Up: View {
    @State var user_email: String = ""
    @State var user_password: String = ""
    @State var user_name: String = ""
    
    func sign_up(name: String, email: String, password: String){
        print(name, email, password)
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Sign Up")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50.0)
                
                Text("Name")
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 290.0)
                
                TextField("Enter Name", text: $user_name).padding(.bottom, 10.0).textFieldStyle(.roundedBorder).frame(maxWidth: 350)
                
                Text("Email")
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 290.0)
                
                TextField("Enter Email", text: $user_email).padding(.bottom, 10.0).textFieldStyle(.roundedBorder).frame(maxWidth: 350)
                
                Text("Password")
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 260.0)
                
                SecureField("Enter Password", text: $user_password).padding(.bottom, 30.0).textFieldStyle(.roundedBorder).frame(maxWidth: 350)
                
                Button(action: {
                    sign_up(name: user_name, email: user_email, password: user_password)
                }){
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 150.0).padding(.vertical, 10)
                }
                .background(Color.blue).clipShape(Capsule())
                
                HStack{
                    Text("Have an account already?")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                    NavigationLink(destination: Login()){
                        Text("Log In")
                            .font(.callout)
                    }
                }.padding(.top, 10.0)
                
            }
            .padding(.horizontal, 25.0)
        }.navigationBarBackButtonHidden(true)
        
    }
}

struct Sign_Up_Previews: PreviewProvider {
    static var previews: some View {
        Sign_Up()
    }
}
