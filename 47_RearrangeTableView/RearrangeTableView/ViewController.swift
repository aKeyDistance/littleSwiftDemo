//
//  ViewController.swift
//  RearrangeTableView
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var editorButton: UIBarButtonItem!
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var animals = ["bat","cat","rat","butterfly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
    }

    @IBAction func editPressed(_ sender: UIBarButtonItem) {
        
        tableview.isEditing = !tableview.isEditing
        
        if tableview.isEditing {
            editorButton.title = "done"
        } else {
            editorButton.title = "edit"
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = animals[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let selectedItem = animals[sourceIndexPath.row]
        
        animals.remove(at: sourceIndexPath.row)
        animals.insert(selectedItem, at: destinationIndexPath.row)
        
    }


    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            animals.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
        
    }
    
}

