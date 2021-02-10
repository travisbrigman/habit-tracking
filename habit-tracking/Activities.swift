//
//  Activities.swift
//  habit-tracking
//
//  Created by Travis Brigman on 2/10/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities = [SingleActivity](){
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "activities") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([SingleActivity].self, from: items ) {
                self.activities = decoded
                return
            }
        }
        self.activities = []
    }
}
