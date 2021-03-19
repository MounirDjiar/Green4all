//
//  ProjectDetailView.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import SwiftUI

struct ProjectDetailView: View {
    
    let project:Project
    
    var body: some View {
        VStack(alignment: .leading){
            Image(project.picture)
                .resizable()
                .scaledToFit()
            
            HStack {
                Text("Progress Bar")
            }//:HStack
            
            
            
        }//:VStack
        .padding(.horizontal)
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetailView(project: Project.project1)
    }
}
