//
//  ProfilConnexion.swift
//  Green4all
//
//  Created by Bachir SAHALI on 18/03/2021.
//

import SwiftUI

struct ProfilConnexion: View {
    
    @State var mail: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        NavigationView{
            
            
            ZStack{
                Color("bgGreen")
                    .ignoresSafeArea()
                    
                
                VStack{
                Form {
                    TextField("", text: $mail)
                        .onAppear{
                            UITextField.appearance().attributedPlaceholder = NSAttributedString(string: "Émail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.green])
                        }
                    SecureField("Mot de Passe", text: $password)
                        
                }
                .onAppear{
                    UITableView.appearance().backgroundColor = .clear
                }
                   

                }
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Se Connecter")
                })
                .padding(.horizontal, 100)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                
                Spacer()
                
                
                
            }.foregroundColor(.white)
            .navigationBarTitle("Connexion", displayMode: .inline)
            .onAppear{
                UINavigationBar.appearance().shadowImage = UIImage()
                UINavigationBar.appearance().barTintColor = .clear
                UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            
    }
        }

    }}

struct ProfilConnexion_Previews: PreviewProvider {
    static var previews: some View {
        ProfilConnexion()
    }
}
