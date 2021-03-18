//
//  CreateProjetView.swift
//  Green4all
//
//  Created by Baptiste Moulin on 18/03/2021.
//

import SwiftUI



enum Category {
    case bioeconomie, risqueclimatique, economiebleu, financeverte, social, marche, none
}

struct Cat: Identifiable {
    let id = UUID()
    var active: Bool = false
    let img: Category
    let name: String
}

struct Project :Identifiable {

    let id:UUID = UUID()
    let title:String
    let description_project:String
    let budget: Int
    let picture: String
    let video:String?
    let created_date = Date()
    let finished_date: Date
    let categories: Category
}

let categories = [
    Cat(img: Category.bioeconomie, name: "Bioéconomie"),
    Cat(img: Category.risqueclimatique, name: "Risque climatique"),
    Cat(img: Category.economiebleu, name: "Économie bleu"),
    Cat(img: Category.financeverte, name: "Finance Verte"),
    Cat(img: Category.social, name: "Social"),
    Cat(img: Category.marche, name: "Marchés")
]

struct CreateProjetView: View {
    @State var title: String = ""
    @State var desc: String = ""
    @State var budget: String = ""
    @State var urlvideo: String = ""
    @State var urlimg: String = ""
    @State var duree: String = ""

    @State private var selectedcat = Category.none
    
    var body: some View {

        VStack {
            Form {
                TextField("Titre", text: $title)
                TextEditor(text: $desc)
                    .frame(height: 100)
                    .lineLimit(10)
                    .overlay(
                        HStack {
                            VStack {
                                Text("\(desc.count > 0 ? "" : "Description")")
                                    .opacity(0.25)
                                    .padding(.top, 7.0)
                                    .padding(.leading, 3.0)
                                Spacer()
                            }
                            Spacer()
                        }
                    )
                ScrollView (.horizontal){
                    HStack {
                        ForEach (categories) { cat in
                            Button(action: {
                                if (selectedcat == cat.img){
                                    selectedcat = Category.none
                                }
                                else{
                                    selectedcat = cat.img
                                }
                            }, label: {
                                if (selectedcat == cat.img)
                                {
                                    Image("\(cat.img)")
                                        .resizable()
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .cornerRadius(7)
                                        .border(Color.green, width: 10)
                                }
                                else
                                {
                                    Image("\(cat.img)")
                                        .resizable()
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .cornerRadius(7)
                                        .overlay(
                                            VStack {
                                                Spacer()
                                                Text(cat.name)
                                                Text("")
                                                    .frame(height: 2)
                                            }
                                        )
                                }
                            })
                                
                        }
                    }
                }
                
                TextField("Budget (€)", text: $budget).keyboardType(.numberPad)
                TextField("Durée de la campagne (en jours)", text: $duree).keyboardType(.numberPad)
                TextField("URL Image", text: $urlvideo)
                TextField("URL Vidéo (optionnel)", text: $urlimg)
            }
        }
    }
}

struct CreateProjetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjetView()
    }
}
