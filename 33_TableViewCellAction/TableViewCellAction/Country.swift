//
//  Country.swift
//  TableViewCellAction
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import Foundation
import UIKit

class Country {
    
    var name : String
    var capital : String
    var image : UIImage
    
    init(name: String , capital : String){
        
        self.name = name
        self.capital = capital
        
        self.image = UIImage(named: self.name)!
    }
    
    
}
