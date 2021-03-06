//
//  DailyEntriesViewController.swift
//  Are-You-Happy?
//
//  Created by Alson Yupeng Zhang on 4/6/19.
//  Copyright © 2019 Group-182. All rights reserved.
//

import Foundation
import UIKit

class DailyEntriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //@IBOutlet weak var dailyEntriesScrollView: UIScrollView!
    @IBOutlet weak var dailyEntriesTable: UITableView!
    
    
    var items: [String] = ["test", "ok"]
    var dailyDates: [String] = []
    var dailyRating: [String] = []
    var dailyActivities: [String] = []
    
    override func viewDidLoad() {
        let storage = Storage()
        var dailyEntries: [DailyEntry] = []
        do {
            dailyEntries = try storage.loadDailyEntries()
        } catch {}
        for i in 0..<dailyEntries.count {
            dailyDates.append(dailyEntries[i].date)
            dailyRating.append("\(dailyEntries[i].rating)")
            //let activityNames = dailyEntries[i].activityNames
        }
        //super.viewDidLoad()
//        let storage = Storage()
//        var dailyEntries: [DailyEntry] = []
//        do {
//            dailyEntries = try storage.loadDailyEntries()
//        } catch {}
//        for i in 0..<dailyEntries.count {
//            let frame = CGRect(x: 50 , y: 50 + i*50, width: 200, height: 50)
//            let date = dailyEntries[i].date
//            //let rating = dailyEntries[i].rating
//            //let activityNames = dailyEntries[i].activityNames
//
//
//            let dateLabel = UILabel(frame: frame)
//            dateLabel.text = date
//
//            self.dailyEntriesScrollView.addSubview(dateLabel)
//
//        }
//        let frame = CGRect(x: 50 , y: 50 + 50, width: 200, height: 50)
//        let label = UILabel(frame: frame)
//        label.text = "testing"
//        dailyEntries.addSubview(label)
        //loadTableCells()
        
        //self.tableView.registerClass()
        
        
        
    }
    
    func loadTableCells() {
        
        //dailyEntriesTable.sectionIndexMinimumDisplayRowCount = 5
        //let test = UITableViewCell()
        
        //test.textLabel = "lol"
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyDates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // return UITableViewCell()
        //var cell:UITableViewCell = self.dailyEntriesTable.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        
        //cell.textLabel?.text = self.items[indexPath.row]
        
        //return cell
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
        }
        
        cell!.textLabel?.text = dailyDates[indexPath.row]
        cell!.detailTextLabel?.text = dailyRating[indexPath.row]
        print(indexPath.row)
        return cell!
    }
    
}
