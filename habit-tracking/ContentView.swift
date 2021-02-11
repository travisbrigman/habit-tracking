//
//  ContentView.swift
//  habit-tracking
//
//  Created by Travis Brigman on 2/10/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Activities()
    
    @State private var showModifyHabitView = false
    
    var body: some View {
                NavigationView {
            List {
                ForEach(habits.activities.indices) {
                    index in HStack {
                        NavigationLink(destination: HabitView(index: index, habits: self.habits)) {
                        VStack {
                            Text(self.habits.activities[index].activityTitle)
                                .font(.headline)
                            Text(self.habits.activities[index].activityDescription)
                        }
                        Spacer()
                            Text("\(self.habits.activities[index].activityCompleted)")
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(leading: EditButton() ,trailing: Button( action: { self.showModifyHabitView = true
            }){
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showModifyHabitView) {
            ModifyHabitView(habits: self.habits)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
