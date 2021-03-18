//
//  ProfilPresentation.swift
//  Green4all
//
//  Created by Bachir SAHALI on 18/03/2021.
//

import SwiftUI

struct ProfilPresentation: View {
    
    let profil: Profil
    
    var body: some View {
        VStack{
            HStack{
                Image("profil")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(maxWidth: 150)
                
                VStack(alignment: .leading){
                    Text(profil.firstname)
                        .fontWeight(.bold)
                        .font(.system(size:27))
                    
                    Text(profil.lastname)
                        .fontWeight(.bold)
                        .font(.system(size:25))
                        .opacity(0.7)
                    
                    Text(profil.mail)
                        .font(.system(size:10))
                    Spacer()
                    Text("Total investit")
                        .font(.system(size:15))
                    Text("35900" + " €")
                        .fontWeight(.bold)
                        .font(.system(size:27))
                    
                }
                .frame( maxHeight: 200)
                
            }
        }
        .frame( maxHeight: 150)
    }
}

struct ProfilPresentation_Previews: PreviewProvider {
    static var previews: some View {
        ProfilPresentation( profil: Profil(firstname: "Baptiste", lastname: "Moulin", image: "Profil", mail: "baptiste.moulin@gmail.com", password: "password"))
    }
}
