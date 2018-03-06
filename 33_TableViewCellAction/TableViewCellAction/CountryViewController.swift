//
//  CountryViewController.swift
//  TableViewCellAction
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var capitalLabel: UILabel!
    
    var country : Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryLabel.text = country?.name.capitalized
        capitalLabel.text = country?.capital.capitalized
        imageView.image = country?.image
    }


  

}
