//
//  ViewController.swift
//  PickerviewPractice
//
//  Created by YJ on 2022/02/11.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var citiesManager = CitiesManager()
    
    @IBOutlet weak var pickerResultLabel: UILabel!
    @IBOutlet weak var testPickerview: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testPickerview.dataSource = self
        testPickerview.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return citiesManager.cities.count
        } else {
            let selectedCity = testPickerview.selectedRow(inComponent: 0)
            return citiesManager.cities[selectedCity].tourAttractions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return citiesManager.cities[row].name
        } else {
            let selectedCity = testPickerview.selectedRow(inComponent: 0)
            return citiesManager.cities[selectedCity].tourAttractions[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            testPickerview.selectRow(0, inComponent: 1, animated: false)
        }

        let cityIdx = testPickerview.selectedRow(inComponent: 0)
        let selectedCity = citiesManager.cities[cityIdx].name
        let tourIdx = testPickerview.selectedRow(inComponent: 1)
        let selectedTourAttraction = citiesManager.cities[cityIdx].tourAttractions[tourIdx]
        pickerResultLabel.text = "\(selectedTourAttraction), \(selectedCity)"
        
        testPickerview.reloadComponent(1)
    }
}

