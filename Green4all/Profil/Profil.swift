//
//  Profil.swift
//  Green4all
//
//  Created by Bachir SAHALI on 18/03/2021.
//

import Foundation

struct Profil: Identifiable {
    let id = UUID()
    let firstname: String
    let lastname: String
    let image: String?
    let mail: String
    let password: String
}
