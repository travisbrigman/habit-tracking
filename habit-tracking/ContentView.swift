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
                ForEach(habits.activities) {
                    habit in HStack {
                        VStack {
                            Text(habit.activityTitle)
                                .font(.headline)
                            Text(habit.activityDescription)
                        }
                        Spacer()
                        Text("\(habit.activityCompleted)")
                            
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
