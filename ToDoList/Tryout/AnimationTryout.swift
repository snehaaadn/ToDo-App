//
//  AnimationTryout.swift
//  ToDoList
//
//  Created by Sneha Debnath on 14/10/24.
//

import SwiftUI

struct AnimationTryout: View {
    @State var title: String = ""
    @State var description: String = ""
    @State var txt: String = ""
    @State var showText: Bool = false
    
    //@State var items: [Item] = []
    //@State var isCompleted: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                if showText {
                    withAnimation(.easeInOut) {
                        Text("TITLE")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .offset(x: 10, y: 25)
                    }
                    Spacer()
                }
            }
            .padding()
            
            TextField("", text: $title)
                .frame(height: 50)
                .background(Color.gray.opacity(0.2).cornerRadius(10))
                .padding(.horizontal)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.white, Color.black.opacity(0.7)]), startPoint: .top, endPoint: .bottom),
                                lineWidth: 3.0)
                        .frame(height: 50)
                        .padding(.horizontal)
                })
                .onTapGesture(count: 1) {
                    showText.toggle()
                }
            
            //DESCRIPTION
            HStack {
                Text("Description".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            .offset(x: 10, y: 41)
            
            TextEditor(text: $description)
                .frame(height: 200)
                .colorMultiply(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color.white, Color.black.opacity(0.7)]), startPoint: .top, endPoint: .bottom),
                                lineWidth: 3.0)
                        .frame(height: 200)
                        .padding(.horizontal)
                })
        }
    }
}

#Preview {
    AnimationTryout()
}
