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
    var title:String
    var description_project:String
    var budget: Int
    var picture: String
    var video:String?
    var created_date = Date()
    var finished_date: Date
    var categories: Category
}

let categories = [
    Cat(img: Category.bioeconomie, name: "Bioéconomie"),
    Cat(img: Category.risqueclimatique, name: "Risque climatique"),
    Cat(img: Category.economiebleu, name: "Économie bleu"),
    Cat(img: Category.financeverte, name: "Finance Verte"),
    Cat(img: Category.social, name: "Social"),
    Cat(img: Category.marche, name: "Marchés")
]

struct CreateProjectView: View {
    @State var title: String = ""
    @State var desc: String = ""
    @State var budget: String = ""
    @State var urlvideo: String = ""
    @State var urlimg: String = ""
    @State var duree: String = ""
    @State var projet: Project = Project(title: "", description_project: "", budget: 0, picture: "", video: "", finished_date: Date(), categories: Category.none)

    @State private var selectedcat = Category.none

    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {

        ZStack {
            Color("ColorGreen").ignoresSafeArea()
            VStack {
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("annuler").padding()
                    })
                    Spacer()
                    Text("Nouveau projet")
                        .font(.title3)
                        .foregroundColor(Color.white)
                    Spacer()
                    Button(action: {
                        self.projet.title = title
                        self.projet.description_project = desc
                        self.projet.budget = Int(budget) ?? 0
                        self.projet.picture = urlimg
                        self.projet.video = urlvideo
                        self.projet.finished_date = Date().addingTimeInterval(TimeInterval(86400 * (Int(duree) ?? 0)))
                        self.projet.categories = selectedcat
                    }, label: {
                        Text("Créer").padding()
                    })
                }
                Form {
                    TextField("Titre", text: $title)
                    Section {
                        
                        VStack {
                            HStack {
                                Text("Catégories")
                                    .bold()
                                    .padding(.leading, -10)
                                Spacer()
                            }
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
                                                        .frame(width: 125, height: 125)
                                                        .cornerRadius(7)
                                                        .border(Color.green, width: 10)
                                                }
                                                else
                                                {
                                                    Image("\(cat.img)")
                                                        .resizable()
                                                        .frame(width: 125, height: 125)
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
                            }.padding(.horizontal, -10)
                        }
                    }
                    Section {
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
                    }
                    Section {
                        TextField("Budget (€)", text: $budget).keyboardType(.numberPad)
                    }
                    Section {
                        TextField("Durée de la campagne (en jours)", text: $duree).keyboardType(.numberPad)
                    }
                    Section {
                        TextField("URL Image", text: $urlvideo)
                    }
                    Section {
                        TextField("URL Vidéo (optionnel)", text: $urlimg)
                    }
                }
            }
        }
        
    }
}

struct CreateProjetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView()
    }
}
