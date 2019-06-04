//
//  ActivityCorrelatorController.swift
//  Are-You-Happy?
//
//  Created by Alson Zhang on 4/6/19.
//  Copyright © 2019 Group-182. All rights reserved.
//

import UIKit

class ActivityCorrelatorController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var withActivityLabel: UILabel!
    @IBOutlet weak var withoutActivityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var data: [DailyEntry] = []
    var activitiesList: [String] = []
    var entryActivities: [String] = []
    var withActivityRating: [Int] = []
    var withoutActivityRating: [Int] = []
    
    var withActAvg: Double = 0.0
    var withoutActAvg: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = Storage()
        do {
            data = try storage.loadDailyEntries()
        } catch {}
        getAllActivities(data)
    }
    func pickActivityToView( _ activity: String) {
        withActivityRating = []
        withoutActivityRating = []
        for i in 0..<data.count {
            //data[i].activityNames
            if(containsActivity(activity, data[i].activityNames)) {
                withActivityRating.append(data[i].rating)
            } else {
                withoutActivityRating.append(data[i].rating)
            }
        }
    }
    
    func averageRating() {
        withActAvg = 0.0
        withoutActAvg = 0.0
        if(withActivityRating.count != 0) {
            let withActSum = withActivityRating.reduce(0, +)
            withActAvg = Double(withActSum)/Double(withActivityRating.count)
        } else {
            withActAvg = 0
        }
        if(withoutActivityRating.count != 0) {
            let withoutActSum = withoutActivityRating.reduce(0, +)
            withoutActAvg = Double(withoutActSum)/Double(withoutActivityRating.count)
        } else {
            withoutActAvg = 0
        }
    }
    
    func containsActivity( _ activity: String, _ activities: [String]) -> Bool {
        for i in 0..<activities.count {
            if(activity == activities[i]) {
                return true
            }
        }
        return false
    }
    
    func getAllActivities( _ entries:[DailyEntry]) {
        for i in 0..<entries.count {
            for j in 0..<entries[i].activityNames.count {
                if(!containsActivity(entries[i].activityNames[j], activitiesList)) {
                    activitiesList.append(entries[i].activityNames[j])
                }
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return activitiesList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return activitiesList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //imageView.image =
        pickActivityToView(activitiesList[row])
        averageRating()
        
        if(withActAvg > 0) {
            withActivityLabel.text = String(format: "%.1f", withActAvg)
        } else {
            withActivityLabel.text = "N/A"
        }
        if(withActAvg > 0) {
            withoutActivityLabel.text = String(format: "%.1f", withoutActAvg)
        } else {
            withoutActivityLabel.text = "N/A"
        }
        
    }
    
}
