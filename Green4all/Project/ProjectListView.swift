//
//  ProjectListView.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        
        // NAVIGATION
        NavigationView {
            List (Project.listProjects) { project in
                ProjectRowView(project: project)
            } //: LIST
        } //: NAVIGATION
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
