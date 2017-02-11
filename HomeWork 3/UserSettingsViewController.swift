//
//  ViewController.swift
//  HomeWork 3
//
//  Created by Abdullah on 2/9/17.
//  Copyright © 2017 Abdullah. All rights reserved.
//

import UIKit

class UserSettingsViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var schoolTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nameObject = UserDefaults.standard.object(forKey: "name")
        if let name = nameObject as? String {
            nameTextField.text = name;
        }
        let schoolObject = UserDefaults.standard.object(forKey: "school")
        if let school = schoolObject as? String {
            schoolTextField.text = school;
        }
        let stateObject = UserDefaults.standard.object(forKey: "state")
        if let state = stateObject as? String {
            stateTextField.text = state;
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(schoolTextField.text, forKey: "school")
        UserDefaults.standard.set(stateTextField.text, forKey: "state")
        
    }

}

