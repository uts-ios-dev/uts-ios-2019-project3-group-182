//
//  SettingsController.swift
//  Are-You-Happy?
//
//  Created by ALson Zhang on 2/6/19.
//  Copyright © 2019 Group-182. All rights reserved.
//

import UIKit

class SettingsController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tempColor: UILabel!
    @IBOutlet weak var colourPicker: UIPickerView!
    @IBOutlet weak var imagePicker: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    var colorOptions = ["red", "blue", "green", "brown", "yellow", "magenta", "pink", "cyan", "orange"]
    var imageOptions = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: setup activities
        // TODO: send data to json
        // imageOptions = [];
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
        } else {
            // change colour of image? or something
        }
    }
    
}
