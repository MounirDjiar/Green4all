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
                        Section {
                        TextField("Émail", text: $mail)
                            .onAppear{
                                UITextField.appearance().attributedPlaceholder = NSAttributedString(string: "Émail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
                            }
                        SecureField("Mot de Passe", text: $password)
                        
                        }
                    }
                    .foregroundColor(Color("bgDarkGreen"))
                    .frame(maxHeight: 150)
                    .onAppear{
                        UITableView.appearance().backgroundColor = .clear
                    }
                    
                    VStack(spacing: 50){
                        
                        VStack{
                        Button(action: {}, label: {
                            Text("Se Connecter")
                                .fontWeight(.bold)
                        })
                        .padding(.horizontal, 100)
                        .padding()
                        .background(Color("bgDarkGreen"))
                        .cornerRadius(10)
                        
                        
                        Button(action: {}, label: {
                            Text("Mot de Passe oublié ?")
                                .fontWeight(.bold)
                        })
                        }
                        
                        Divider()
                        
                        VStack(spacing:15){
                        Text("Nouveau sur Green4All ?")
                            .fontWeight(.bold)
                        
                        Button(action: {}, label: {
                            Text("S'inscrire")
                                .fontWeight(.bold)
                        })
                        .padding(.horizontal, 115)
                        .padding()
                        .background(Color("bgDarkGreen"))
                        .cornerRadius(10)
                        }
                    }
                    
                }
                
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
