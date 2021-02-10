//
//  SingleActivity.swift
//  habit-tracking
//
//  Created by Travis Brigman on 2/10/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import Foundation

public struct SingleActivity: Identifiable, Codable {
    public let id = UUID()
    
    var activityTitle: String
    var activityDescription: String
    var activityCompleted: Int
}
