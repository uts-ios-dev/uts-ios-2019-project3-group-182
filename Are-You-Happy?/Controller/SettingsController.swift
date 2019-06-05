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
    @IBOutlet weak var segment: UISegmentedControl!
    
    var colorRow: Int = 0
    var imageRow: Int = 0
    var defaultActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: setup activities
        // TODO: send data to json
        imageView.image = UIImage(named: "airplane")
        imageView.tintColor = UIColor.red

    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        switch segment.selectedSegmentIndex {
        case 0:
            defaultActive = true
        case 1:
            defaultActive = false
        default:
            break
        }
    }
    
    @IBAction func addActivity(_ sender: Any) {
        let tempActivity = Activity(nameField.text!, defaultActive, colors.imageOptions[imageRow], colorRow)
        let storage = Storage()
        do {
            try storage.saveActivities(tempActivity)
        } catch {}
        resetFields()
    }
    
    // Resets the pickerviews and fields
    func resetFields() {
        colourPicker.selectRow(0, inComponent: 0, animated: true)
        imagePicker.selectRow(0, inComponent: 0, animated: true)
        nameField.text = ""
        segment.selectedSegmentIndex = 1
        pickerView(colourPicker, didSelectRow: 0, inComponent: 0)
        pickerView(imagePicker, didSelectRow: 0, inComponent: 0)
    }
    
    // Delete all Current Activities in Json file
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
            return colors.imageOptions.count
        } else {
            return colors.colorOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 1) {
            return colors.imageOptions[row]
        } else {
            return colors.colorOptions[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 1) {
            //change image view
            imageView.image = UIImage(named: colors.imageOptions[row])
            imageRow = row
        } else {
            // change colour of image? or something
            imageView.tintColor = colors.uiColorOptions[row]
            colorRow = row
        }
    }
    
}
