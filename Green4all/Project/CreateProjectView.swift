//
//  CreateProjetView.swift
//  Green4all
//
//  Created by Baptiste Moulin on 18/03/2021.
//

import SwiftUI


let categories = [
    Cat(img: Category.bioeconomie, name: "Bioéconomie"),
    Cat(img: Category.risqueclimatique, name: "Risque climatique"),
    Cat(img: Category.economiebleu, name: "Économie bleu"),
    Cat(img: Category.financeverte, name: "Finance Verte"),
    Cat(img: Category.social, name: "Social"),
    Cat(img: Category.marche, name: "Marchés")
]

struct CreateProjectView: View {
    
    @Binding var showAddProjectView:Bool
    @State var showingAlert = false
    
    @State var title: String = ""
    @State var desc: String = ""
    @State var budget: String = ""
    @State var urlvideo: String = ""
    @State var urlimg: String = ""
    @State var duree: String = ""
    
    @State var projet: Project = Project(
        title: "",
        description_project: "",
        budget: 0,
        picture: "",
        video: "",
        finished_date: Date(),
        category: Category.none
    )

    @State private var selectedcat = Category.none
    
//    init() {
//        UITableView.appearance().backgroundColor = .clear
//    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("bgGreen").ignoresSafeArea()
                
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
            .navigationBarTitle("Nouveau projet", displayMode: .inline)
            .navigationBarItems(leading: cancelButton, trailing: addButton)
        }
    }
}

extension CreateProjectView {
    
    private var cancelButton: some View {
        Button("Annuler") {
            showAddProjectView = false
        }
    }
    
    private var addButton: some View {
        Button("Créer") {
            
            if title == "" || desc == "" || Int(budget) ?? 0 == 0 || urlimg == "" || Int(duree) ?? 0 == 0 {
                showingAlert = true
                
            }
            else {
                self.projet.title = title
                self.projet.description_project = desc
                self.projet.budget = Int(budget) ?? 0
                self.projet.picture = urlimg
                self.projet.video = urlvideo
                self.projet.finished_date = Date().addingTimeInterval(TimeInterval(86400 * (Int(duree) ?? 0)))
                self.projet.category = selectedcat
                
                self.showingAlert = false
                self.showAddProjectView = false
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        }
    }
}

struct CreateProjetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProjectView(showAddProjectView: .constant(false))
    }
}

