//
//  DailyEntriesViewController.swift
//  Are-You-Happy?
//
//  Created by Alson Yupeng Zhang on 4/6/19.
//  Copyright © 2019 Group-182. All rights reserved.
//

import Foundation
import UIKit

class DailyEntriesViewController: UIViewController {
    @IBOutlet weak var dailyEntriesScrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        //super.viewDidLoad()
        let storage = Storage()
        var dailyEntries: [DailyEntry] = []
        do {
            dailyEntries = try storage.loadDailyEntries()
        } catch {}
        for i in 0..<dailyEntries.count {
            let frame = CGRect(x: 50 , y: 50 + i*50, width: 200, height: 50)
            let date = dailyEntries[i].date
            //let rating = dailyEntries[i].rating
            //let activityNames = dailyEntries[i].activityNames


            let dateLabel = UILabel(frame: frame)
            dateLabel.text = date

            self.dailyEntriesScrollView.addSubview(dateLabel)

        }
//        let frame = CGRect(x: 50 , y: 50 + 50, width: 200, height: 50)
//        let label = UILabel(frame: frame)
//        label.text = "testing"
//        dailyEntriesScrollView.addSubview(label)

        
    }
    
}
