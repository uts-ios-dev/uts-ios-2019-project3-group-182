//
//  ActivityCorrelatorController.swift
//  Are-You-Happy?
//
//  Created by Alson Zhang on 4/6/19.
//  Copyright © 2019 Group-182. All rights reserved.
//

import UIKit
import Charts

class ActivityCorrelatorController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var withActivityLabel: UILabel!
    @IBOutlet weak var withoutActivityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityPicker: UIPickerView!
    @IBOutlet weak var chtBar: BarChartView!
    
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
        setupStart()
    }
    func setupStart() {
        activityPicker.selectRow(0, inComponent: 0, animated: true)
        pickerView(activityPicker, didSelectRow: 0, inComponent: 0)
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
        imageView.image = UIImage(named: findImageof(activitiesList[row]))
        imageView.tintColor = colors.uiColorOptions[findColorof(activitiesList[row])]
        pickActivityToView(activitiesList[row])
        averageRating()
        
        if(withActAvg > 0) {
            withActivityLabel.text = String(format: "%.1f", withActAvg)
        } else {
            withActivityLabel.text = "N/A"
        }
        if(withoutActAvg > 0) {
            withoutActivityLabel.text = String(format: "%.1f", withoutActAvg)
        } else {
            withoutActivityLabel.text = "N/A"
        }
        updateBarChart()
    }
    func findColorof( _ actName: String) -> Int{
        let storage = Storage()
        var act: [Activity] = []
        do {
            act = try storage.loadActivities()
        } catch {}
        for i in 0..<act.count {
            if(actName == act[i].name) {
                return act[i].color
            }
        }
        return 0
    }
    
    func findImageof( _ actName: String) -> String{
        let storage = Storage()
        var act: [Activity] = []
        do {
        act = try storage.loadActivities()
        } catch {}
        for i in 0..<act.count {
            if(actName == act[i].name) {
                return act[i].image
            }
        }
        return "N/A"
    }
    
    func updateBarChart() {
        let value1 = BarChartDataEntry(x: 1, y: withActAvg)
        let value2 = BarChartDataEntry(x: 2, y: withoutActAvg)
        var withColor: UIColor
        var withoutColor: UIColor
        if (withActAvg > withoutActAvg) {
            withColor = UIColor.green
            withoutColor = UIColor.red
        } else {
            withColor = UIColor.red
            withoutColor = UIColor.green
        }
        
        let set = BarChartDataSet(entries: [value1, value2], label: "Happiness WITH and WITHOUT activity")
        set.drawIconsEnabled = false
        set.colors = [withColor, withoutColor]
        set.stackLabels = ["Happiness with", "Happiness without"]
        let data = BarChartData(dataSet: set)
        
        chtBar.leftAxis.axisMinimum = 1
        chtBar.leftAxis.axisMaximum = 5
        
        chtBar.fitBars = true
        chtBar.data = data
    }
}
