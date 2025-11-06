//
//  ContentView.swift
//  Singing_Stella
//
//  Created by Rochelle Tham on 11/2/25.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var focused: Bool
    @FocusState private var countfocused: Bool
    
    @State private var key = ""
    @State private var count = 0
    @State var selected = "Archery"
    @State private var id = 1
    
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]

    
    let gradient = Gradient(colors: [.red, .yellow])
    var body: some View {
        VStack {
            Text("My Activity")
                .font(.largeTitle.bold())
            Spacer()
            VStack {
                Text("type count: " + String(key.count) + "\n")
                Text(key)
                    .focusable() 
                    .focused($focused)
                    .onKeyPress { press in
                        print("Received \(press.characters)")
                        count = count + 1
                        key += press.characters
                        if (key.count == 50) {
                            key = ""
                        }
                        return .ignored
                    }
                    .onAppear {
                        focused = true
                    }
            }
//
            VStack {
                Circle()
                    .fill(
                        colors.randomElement() ?? .green)
//                            LinearGradient(
//                                gradient: Gradient(colors: [.green, .yellow, .blue]), // Define your gradient colors
//                                startPoint: .top, // Starting point of the gradient
//                                endPoint: .bottom // Ending point of the gradient
//                            )
//                        )
                    .overlay(
                        Image(systemName: "figure.\(selected.lowercased())")
                            .font(.system(size: 65))
                            .foregroundColor(.white)
                    )
                    .frame(width: 200, height: 200) // size of circle
                    .padding()
                             
                Text("\(selected)!").font(.title)

            }
            .transition(.slide)
            .id(id)
            
            Spacer()
            Button("Random sport") {
                // change activity
                withAnimation(.easeInOut(duration: 0.35)) {
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        
    }
}

#Preview {
    ContentView()
}
