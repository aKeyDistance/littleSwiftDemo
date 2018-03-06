//
//  ViewController.swift
//  CollectionViewJSON
//
//  Created by Shaw on 02/03/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit


struct Hero: Decodable {
    
    let localized_name:String
    let img:String
    
}

class ViewController: UIViewController, UICollectionViewDataSource {

    
    var heroes = [Hero]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        collectionView.delegate = self
        collectionView.dataSource = self
        
        let url = URL(string: "https://api.opendota.com/api/heroStats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                
                do {
                    self.heroes = try JSONDecoder().decode([Hero].self,from: data!)

                }catch {
                    print("Parse Error")
                }
                
                DispatchQueue.main.async {
                    print(self.heroes.count)
                    
                    self.collectionView.reloadData()
                }
                
            }
            
        }.resume()
        
        
        
    
    }

   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.nameLabel.text = heroes[indexPath.row].localized_name.capitalized
        
        let url = "https://api.opendota.com" + heroes[indexPath.row].img
        
        cell.imageView.downloadedFrom(link: url)
        
        cell.imageView.clipsToBounds = true
        cell.imageView.layer.cornerRadius = cell.imageView.frame.height / 2
        cell.imageView.contentMode = .scaleAspectFill
        
        return cell
    }    

}


extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}

