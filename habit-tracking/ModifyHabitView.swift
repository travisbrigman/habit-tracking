//
//  ModifyHabitView.swift
//  habit-tracking
//
//  Created by Travis Brigman on 2/10/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct ModifyHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habits: Activities
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
                
            .navigationBarTitle("Add New Habit")
            .navigationBarItems(trailing: Button("Save"){
                
                let habit = SingleActivity(activityTitle: self.title, activityDescription: self.description, activityCompleted: 0)
                self.habits.activities.append(habit)
                self.presentationMode.wrappedValue.dismiss()
                
            })
        }
    }
}

struct ModifyHabitView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyHabitView(habits: Activities())
    }
}
