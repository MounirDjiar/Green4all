//
//  Project.swift
//  Green4all
//
//  Created by Mounir DJIAR on 18/03/2021.
//

import Foundation


// La structure projet
struct Project :Identifiable {
    
    let id:UUID = UUID()
    let title:String
    let description_project:String
    let budget: Int
    let picture: String
    let video:String?
    let created_date: Date
    let finished_date: Date
    let category: Category
}


// EXTENSIONS
extension Project {
    static var project1:Project = Project(title: "Projet 1", description_project: "Description 1",
        budget: 12000,
        picture: "icon_project1",
        video: "video_project1",
        created_date: Date(),
        finished_date: Date(),
        category: Category.bioeconomie
    )

    static var project2:Project = Project(title: "Projet 2", description_project: "Description 2",
        budget: 12000,
        picture: "icon_project2",
        video: "video_project2",
        created_date: Date(),
        finished_date: Date(),
        category: Category.economiebleu
    )

    static var project3:Project = Project(title: "Projet 3", description_project: "Description 3",
        budget: 12000,
        picture: "icon_project3",
        video: "video_project3",
        created_date: Date(),
        finished_date: Date(),
        category: Category.financeverte
    )

    static var project4:Project = Project(title: "Projet 4", description_project: "Description 4",
        budget: 12000,
        picture: "icon_project4",
        video: "video_project4",
        created_date: Date(),
        finished_date: Date(),
        category: Category.risqueclimatique
    )

    static var listProjects: [Project] = [project1, project2, project3, project4]
}
