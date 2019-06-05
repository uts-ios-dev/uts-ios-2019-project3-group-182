//
//  Settings.swift
//  Are-You-Happy?
//
//  Created by Alson Zhang on 3/6/19.
//  Copyright © 2019 Group-182. All rights reserved.
//

import Foundation
import UIKit
//
enum colors {
    static var uiColorOptions = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.cyan, UIColor.blue, UIColor.brown, UIColor.magenta, UIColor.purple]
    static var colorOptions = ["red", "orange", "yellow", "green", "cyan", "blue", "brown", "pink", "purple"]
    static var imageOptions = ["airplane", "bday", "beer", "bike", "bus", "car", "cloudy day", "coffee", "cupcake", "dinner", "food and wine", "gaming", "goals", "groceries", "hail", "hamburger", "headache", "heavy rain", "meditate", "motorbike", "movies", "party cloudy day", "pizza", "public transport", "raining", "running", "sandwich", "sleeping", "sneeze", "snowing", "storm", "sunny", "taxi", "tea", "traffic jam", "train", "truck", "vr", "walk", "windy", "wine", "workout"]
    static var dummycoffee = ["coffee"]
    static var dummyrunning = ["running"]
    static var dummydinner = ["dinner"]
    static var dummyData = [
        DailyEntry("01.01.2000", 1, dummycoffee),
        DailyEntry("02.01.2000", 1, dummycoffee),
        DailyEntry("03.01.2000", 1, dummycoffee),
        DailyEntry("04.01.2000", 1, dummycoffee),
        DailyEntry("05.01.2000", 1, dummycoffee),
        DailyEntry("06.01.2000", 1, dummycoffee),
        DailyEntry("07.01.2000", 1, dummycoffee),
        DailyEntry("01.02.2000", 5, dummyrunning),
        DailyEntry("02.02.2000", 5, dummyrunning),
        DailyEntry("03.02.2000", 5, dummyrunning),
        DailyEntry("04.02.2000", 5, dummyrunning),
        DailyEntry("05.02.2000", 5, dummyrunning),
        DailyEntry("01.03.2000", 3, dummydinner),
        DailyEntry("02.03.2000", 3, dummydinner),
        DailyEntry("03.03.2000", 3, dummydinner),
        DailyEntry("04.03.2000", 3, dummydinner),
        DailyEntry("05.03.2000", 3, dummydinner),
    ]
}
