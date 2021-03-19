//
//  Category.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import Foundation

enum Category {
    case bioeconomie, risqueclimatique, economiebleu, financeverte, social, marche, none
}


struct Cat: Identifiable {
    let id = UUID()
    var active: Bool = false
    let img: Category
    let name: String
}
