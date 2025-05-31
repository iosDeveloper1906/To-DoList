//
//  To_DoListApp.swift
//  To-DoList
//
//  Created by Vaibhav Gawde on 31/05/25.
//

import SwiftUI

@main
struct To_DoListApp: App {
    
    @State private var path : [Router] = []
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack(path: $path){
                ListView(path: $path)
                    .navigationDestination(for: Router.self) { route in
                        switch route {
                        case .addfile:
                            AddView(path: $path)
                        }
                    }
            }.environmentObject(listViewModel)
            
            
        }
    }
}
