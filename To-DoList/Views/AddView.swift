//
//  AddView.swift
//  To-DoList
//
//  Created by Vaibhav Gawde on 31/05/25.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @Binding var path : [Router]
    @EnvironmentObject var listModel : ListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .frame(height: 50)
                    .padding([.leading, .trailing], 24)
                    .overlay {
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.clear)
                            .stroke(Color.gray, lineWidth : 1)
                            .padding(.horizontal,12)
                    }
                
                Button {
                    saveData()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(uiColor: UIColor.secondarySystemBackground))
                        .cornerRadius(12.0)
                        .padding(.horizontal,24)
                        .padding(.top, 12)
                }

            }
            
            
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveData(){
        if textFieldText.count < 3 {
            alertTitle = "You are new to do item must be aleast 3 character long 😥"
            showAlert = true
        }else {
            listModel.addItem(title: textFieldText)
            path.removeLast()
        }
    }
    
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
//    NavigationStack {
//        AddView()
//    }
}
