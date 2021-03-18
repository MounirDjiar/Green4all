//
//  ProjectListView.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import SwiftUI

struct ProjectListView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @State var searchText: String = ""
    
    var body: some View {
    
        // NAVIGATION
        NavigationView {
            ZStack {
                Color("bgGreen").ignoresSafeArea()
                
                VStack {
                    
                    // SearchBar
                    HStack {
                        TextField("Rechercher", text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .opacity(0.9)
                            .foregroundColor(Color("greenSearchBar"))
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    // Liste des projets
                    ScrollView {
                        ForEach (Project.listProjects) { project in
                            ProjectRowView(project: project)
                        }//: ForEach
                    }//:ScrollView
                    
                }//:VStack

            }//:ZStack
            
            .navigationBarTitle("Projets")
            .navigationBarItems(trailing: addButton)
        } //: NAVIGATION
    }
}

extension ProjectListView {
    
    private var addButton : some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "plus")
                .foregroundColor(.white)
        })
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
