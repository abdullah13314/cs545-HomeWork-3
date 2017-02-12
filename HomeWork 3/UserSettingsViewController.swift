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
    @IBOutlet weak var loadName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nameObject = UserDefaults.standard.object(forKey: "name")
        if let name = nameObject as? String {
            loadName.text = name;
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButton(_ sender: Any) {
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        loadName.text = nameTextField.text
        
    }

}

