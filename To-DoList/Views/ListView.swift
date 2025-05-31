//
//  ListView.swift
//  To-DoList
//
//  Created by Vaibhav Gawde on 31/05/25.
//

import SwiftUI

struct ListView: View {
    
    @Binding var path : [Router]
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        
        
        ZStack {
            if listViewModel.items.isEmpty {
                
                NoItemView(path: $path)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
                
            }else {
                List {
                    ForEach(listViewModel.items) { data in
                        ListRowView(title: "This is the first title", item: data)
                            .onTapGesture {
                                withAnimation {
                                    listViewModel.updateItem(item: data)

                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItems)
                    .onMove(perform: listViewModel.moveItems)
                }

            }
        }
        .listStyle(.plain)
        .navigationTitle("My To-Do List")
        .navigationBarItems(leading: EditButton(),
                            trailing: Button(action: {
            path.append(.addfile)
            
        }, label: {
                Text("Add")
        }))
    }
}

#Preview {
//    struct PreviewWrapper: View {
//        @State private var path: [Router] = []
//        
//        var body: some View {
//            ListView(path: $path)
//            
//        }
//        
//    }
//    
//    return PreviewWrapper()
}


