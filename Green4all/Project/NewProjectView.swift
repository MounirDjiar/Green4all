//
//  NewProjectView.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import SwiftUI

struct NewProjectView: View {
    
    @Binding var showAddProjectView:Bool
    
    var body: some View {
        NavigationView {
            Text("Ajout")
            .navigationBarTitle("Nouveau projet")
            .navigationBarItems(leading: cancelButton)
        }
    }
}

extension NewProjectView {
    private var cancelButton: some View {
        Button("Annuler") {
            showAddProjectView = false
        }
    }
}

struct NewProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NewProjectView(showAddProjectView: .constant(false))
    }
}
