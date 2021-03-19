//
//  ProfilView.swift
//  Green4all
//
//  Created by Bachir SAHALI on 18/03/2021.
//

import SwiftUI

struct ProfilView: View {
    
    let profil: Profil
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color("bgGreen")
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    
                    ProfilPresentation(profil: profil)
                    
                    VStack{
                        Text("Mes Projets")
                            .fontWeight(.bold)
                            .font(.system(size:20))
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Mes Contributions")
                            .fontWeight(.bold)
                            .font(.system(size:20))
                    }
                    
                    Spacer()
                    
                }}
                .foregroundColor(.white)
                .navigationBarTitle("Profil", displayMode: .inline)
                .onAppear{
                    UINavigationBar.appearance().shadowImage = UIImage()
                    UINavigationBar.appearance().barTintColor = .clear
                    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
                    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
                }
        }
        
    }
    
}

struct ProfilView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ProfilView(profil: Profil(firstname: "Baptiste", lastname: "Moulin", image: "Profil", mail: "baptiste.moulin@gmail.com", password: "password"))
    }
}
