//
//  LoginSwiftUI.swift
//  BizBud
//
//  Created by Shielda Hidajat on 06/06/23.
//
import SwiftUI
import Foundation

struct Login: View {
    @State var user_email: String = ""
    @State var user_password: String = ""
    
    func login(email: String, password: String) {
        print(email, password)
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Hello, BizBuddies!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50.0)
                
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
                    login(email : user_email, password: user_password)
                    
                }){
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .frame(width: 150.0).padding(.vertical, 10)
                }
                .background(Color.blue).clipShape(Capsule())
                
                HStack{
                    Text("Don't have an account yet?")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                    NavigationLink(destination: Sign_Up()){
                        Text("Sign Up")
                            .font(.callout)
                    }
                }.padding(.top, 10.0)
                
            }
            .padding(.horizontal, 25.0)
        }.navigationBarBackButtonHidden(true)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
