//
//  SettingsController.swift
//  Are-You-Happy?
//
//  Created by ALson Zhang on 2/6/19.
//  Copyright © 2019 Group-182. All rights reserved.
//

import UIKit

class SettingsController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var colourPicker: UIPickerView!
    @IBOutlet weak var imagePicker: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    
    var colorRow: Int = 0
    var imageRow: Int = 0
    // move these into model, or enum or something
    var colorOptions = ["red", "orange", "yellow", "green", "cyan", "blue", "brown", "pink", "purple"]
    var uicolorOptions = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.cyan, UIColor.blue, UIColor.brown, UIColor.magenta, UIColor.purple]
    var imageOptions = ["airplane", "bday", "beer", "bike", "bus", "car", "cloudy day", "coffee", "cupcake", "dinner", "food and wine", "gaming", "goals", "groceries", "hail", "hamburger", "headache", "heavy rain", "meditate", "motorbike", "movies", "party cloudy day", "pizza", "public transport", "raining", "running", "sandwich", "sleeping", "sneeze", "snowing", "storm", "sunny", "taxi", "tea", "traffic jam", "train", "truck", "vr", "walk", "windy", "wine", "workout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: setup activities
        // TODO: send data to json
        imageView.image = UIImage(named: "airplane")
        imageView.tintColor = UIColor.red

    }
    @IBAction func addActivity(_ sender: Any) {
        // grab data from namefield
        // create new activity object first?
        //save to json
        let tempActivity = Activity(nameField.text!, true, imageOptions[imageRow], colorRow)
        let storage = Storage()
        do {
            try storage.saveActivities(tempActivity)
        } catch {}
    }
    @IBAction func DeleteAllActivities(_ sender: Any) {
        let emptyArray: [Activity] = []
        let storage = Storage()
        do {
            try storage.saveActivities(emptyArray)
        } catch {}
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 1) {
            return imageOptions.count
        } else {
            return colorOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 1) {
            return imageOptions[row]
        } else {
            return colorOptions[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 1) {
            //change image view
            imageView.image = UIImage(named: imageOptions[row])
            imageRow = row
        } else {
            // change colour of image? or something
            imageView.tintColor = uicolorOptions[row]
            colorRow = row
        }
    }
    
}
