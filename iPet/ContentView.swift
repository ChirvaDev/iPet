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
    var body: some View {
        NavigationStack{
            List {
                Section {
                    TextField("Name your pet!", text: $vm.pet.name)
                }
                Section{
                    Image(vm.pet.happinessLevel == "Happy ✨" ? "happy_pet" : "sad_pet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .centerH()
                    Text("Age: \(vm.pet.age) seconds")
                    Text("Status: \(vm.pet.happinessLevel)")
                    Text("Hunger: \(vm.pet.hunger)")
                    Text("Thirst: \(vm.pet.thirst)")
                }
                Section("Actions"){
                    Button("Feed 🥩"){
                        vm.feed()
                    }
                    Button("Give water💧"){
                        vm.giveWater()
                    }
                }
            }
            .navigationTitle("My Pet \(vm.pet.name)")
            .onReceive(timer) {_ in
                vm.saveData()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
