//
//  ContentView.swift
//  iPet
//
//  Created by Pro on 06.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 15, on: .main, in: .common)
        .autoconnect()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color("Color1"))]
    }
    
    var body: some View {
        NavigationStack{
            List {
                Section {
                    TextField("Name your pet!", text: $vm.pet.name)
                }
                .listRowBackground(
                    Capsule()
                        .fill(Color(white: 1, opacity: 0.8))
                        .padding(2)
                )
                Section {
                    withAnimation(.default) {
                        Image(vm.pet.happinessLevel == "Happy ✨" ? "happy_pet" : "sad_pet")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .centerH()
                    }
                    
                    Text("Age: \(vm.pet.age) seconds")
                    Text("Status: \(vm.pet.happinessLevel)")
                    Text("Hunger: \(vm.pet.hunger)")
                    Text("Thirst: \(vm.pet.thirst)")
                }
                
                
                Section{
                    Button("Feed 🥩"){
                        vm.feed()
                    }
                    .foregroundColor(.white)
                    Button("Give water💧"){
                        vm.giveWater()
                    }
                    .foregroundColor(.white)
                } header: {
                    Text("Actions")
                        .foregroundColor(.white)
                }
                .listRowBackground(
                    Capsule()
                        .foregroundColor(Color("Color3"))
                        .padding(2)
                )
            }
            .navigationTitle("My Pet \(vm.pet.name)")
            .font(.headline)
            .onReceive(timer) {_ in
                vm.saveData()
                
            }
            .scrollContentBackground(.hidden)
            .background{
                Image("background2")
                    .resizable()
                    .ignoresSafeArea()
                    .rotationEffect(.degrees(90))
                    .scaledToFill()
                    .overlay(Color.black.opacity(0.8))
                
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
