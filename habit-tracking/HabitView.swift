//
//  HabitView.swift
//  habit-tracking
//
//  Created by Travis Brigman on 2/10/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct HabitView: View {
//    var habit: SingleActivity
    var index: Int
    @ObservedObject var habits: Activities

    var body: some View {
        VStack {
            Text(habits.activities[index].activityTitle)
            Text(habits.activities[index].activityDescription)
            Text("\(habits.activities[index].activityCompleted)")
            Button("add"){
                self.habits.activities[self.index].activityCompleted += 1
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
 static var previews: some View {
    HabitView(index: 0, habits: Activities())
    }
}
