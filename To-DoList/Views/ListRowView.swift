//
//  ListRowView.swift
//  To-DoList
//
//  Created by Vaibhav Gawde on 31/05/25.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    let item : ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.titile)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(title: "", item: ItemModel(titile: "THis is the title", isCompleted: true))
}
