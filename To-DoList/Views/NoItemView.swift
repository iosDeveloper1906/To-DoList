//
//  NoItemView.swift
//  To-DoList
//
//  Created by Vaibhav Gawde on 31/05/25.
//

import SwiftUI

struct NoItemView: View {
    
    @State var  animate : Bool = false
    @Binding var path : [Router]
    let secondaryAccentColor = Color("SecondaryColor")

    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                
                Text("Add something")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : Color.accentColor)
                    .cornerRadius(10)
                    .onTapGesture {
                        path.append(.addfile)
                    }
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x:  0,
                        y: animate ? 50 : 30
                    )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(40)
        .onAppear {
            addAnimation()
        }
    }
    
    func addAnimation(){
        guard !animate else {return}
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation.easeInOut(duration: 2.0).repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var path: [Router] = []
        
        var body: some View {
            NoItemView(path: $path)
            
        }
        
    }
    
    return PreviewWrapper()
}
