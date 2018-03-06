//
//  ViewController.swift
//  AccessContacts
//
//  Created by Shaw on 01/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import Contacts


class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    var contactStore = CNContactStore()
    var contacts = [ContactStruct]()
    
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("authorization Successful!")
            }
        }
        
        fetchContacts()
    }

    func fetchContacts(){
        
        
        let key = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let reqeust = CNContactFetchRequest(keysToFetch: key)
        try! contactStore.enumerateContacts(with: reqeust) { (contact, stoppingPointer) in
            
            let name = contact.givenName
            let familyname = contact.familyName
            let number = contact.phoneNumbers.first?.value.stringValue
            
            let contactToAppend = ContactStruct(givenName: name, familyName: familyname, number: number!)
            
            self.contacts.append(contactToAppend)
            
        }
        
        tableview.reloadData()
        
        print(contacts.first?.givenName)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        
        cell.textLabel?.text = contacts[indexPath.row].givenName + "    " + contacts[indexPath.row].familyName
        
        cell.detailTextLabel?.text = contacts[indexPath.row].number

        return cell
    }

}

