//
//  ViewController.swift
//  ApiDataWithImages
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    @IBOutlet weak var tableview: UITableView!
    
    var heros = [HeroStats]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadJSON {
            print("Successful")
            
            self.tableview.reloadData()
        }
        
        tableview.dataSource = self
        tableview.delegate = self
        
    }

  
    func downloadJSON(completed:@escaping () -> ()){
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) {(data, response , error) in
            
            if error == nil {
                
                do  {
                    self.heros = try JSONDecoder().decode([HeroStats].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                } catch {
                    print("JSON Error")
                }
            }
            
        }.resume()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heros.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        cell.textLabel?.text = heros[indexPath.row].localized_name.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showDetails", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? HeroViewController {
            
            destination.hero = heros[(tableview.indexPathForSelectedRow?.row)!]
        }
        
    }
    
}

