//
//  ViewController.swift
//  SectionTableView
//
//  Created by Shaw on 02/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

struct Item {
    var type :String
    var belongings : [String]
}


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView = UITableView()
    var objects = [Item]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.frame = self.view.frame
        self.view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let animals = Item(type: "animals", belongings: ["cat","dog","lion"])
        let birds = Item(type: "birds", belongings: ["bat","pigeon","crow","vulture"])

        objects.append(animals)
        objects.append(birds)
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return objects.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects[section].belongings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = objects[indexPath.section].belongings[indexPath.row].capitalized
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objects[section].type
    }
    
    
    

}

