//
//  ViewController.swift
//  DataPicker
//
//  Created by Shaw on 08/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateField: UITextField!
    
    let picker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
    }

    func createDatePicker() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target : nil, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
    
        dateField.inputAccessoryView = toolbar
        dateField.inputView = picker
        
        picker.datePickerMode = .date
    }

    
    @objc func donePressed() {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        let dateStrring = formatter.string(from: picker.date)
        
        dateField.text = "\(dateStrring)"
        
        self.view.endEditing(true)
    }

}

