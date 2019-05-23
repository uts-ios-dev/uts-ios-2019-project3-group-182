//
//  ViewController.swift
//  Are-You-Happy?
//
//  Created by Alson Yupeng Zhang on 22/5/19.
//  Copyright © 2019 Group-182. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    var rating: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // TODO: Rename button actions
    
    @IBAction func happiestButtonPressed(_ sender: Any) {
        self.rating = 1
        goToActivitiesView()
    }
    
    @IBAction func gourPressed(_ sender: Any) {
        self.rating = 2
        goToActivitiesView()
    }
    
    @IBAction func threePressed(_ sender: Any) {
        self.rating = 3
        goToActivitiesView()
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        self.rating = 4
        goToActivitiesView()
    }
    
    @IBAction func onePressed(_ sender: Any) {
        self.rating = 5
        goToActivitiesView()
    }
    
    func goToActivitiesView() {
        performSegue(withIdentifier: "ActivitesViewSegue", sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ActivitesViewSegue" {
//            let activitiesViewController = segue.destination as! ActivitiesViewController
//            activitiesViewController.rating = self.rating
//        }
//    }
}

