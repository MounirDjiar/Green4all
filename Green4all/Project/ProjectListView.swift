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
    @State var showAddProjectView:Bool = false
    
    var body: some View {
    
        // NAVIGATION
        NavigationView {
            ZStack {
                // La couleur du background
                Color("bgGreen").ignoresSafeArea()
                
                VStack {
                    
                    // SearchBar
                    SearchBar(searchText: $searchText)
                    
                    Divider()
                    
                    //Liste des projets
                    projectList
                    
                }//:VStack

            }//:ZStack
            
            .navigationBarTitle("Projets")
            .navigationBarItems(trailing: addButton)
            
            // La modale addProject
            .sheet(isPresented: $showAddProjectView, content: {
                NewProjectView(showAddProjectView: $showAddProjectView)
            })
            
        } //: NAVIGATION
    }
}


extension ProjectListView {
    
    // Bouton Add de la NavBar
    private var addButton : some View {
        Button(action: {
            showAddProjectView = true
            
        }, label: {
            Image(systemName: "plus")
                .foregroundColor(.white)
        })
    }
    
    // Liste des projets
    private var projectList: some View {
        
        ScrollView {
            ForEach (
                Project.listProjects.filter {
                    searchText.isEmpty ||
                        $0.title.localizedStandardContains(searchText)
                }
            ) { project in
                ProjectRowView(project: project)
            }//: ForEach
        }//:ScrollView
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
