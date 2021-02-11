//
//  HabitView.swift
//  habit-tracking
//
//  Created by Travis Brigman on 2/10/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI


struct HabitView: View {
    var habit: SingleActivity
    
    var body: some View {
        VStack {
        Text(habit.activityTitle)
        Text(habit.activityDescription)
        Text("\(habit.activityCompleted)")
            Button("add"){
                //self.habit.activityCompleted += 1
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
 static var previews: some View {
        HabitView(habit: SingleActivity(activityTitle: "Foo", activityDescription: "Bar", activityCompleted: 5))
    }
}
