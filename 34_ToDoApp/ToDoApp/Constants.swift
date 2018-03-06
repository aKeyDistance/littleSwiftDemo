//
//  Constants.swift
//  ToDoApp
//
//  Created by Shaw on 28/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import Foundation


var todoList:[String]?

func saveData(todoList:[String]) {
    
    UserDefaults.standard.set(todoList, forKey: "todoList")
}

func fetchData() -> [String]? {
    
    if let todo = UserDefaults.standard.array(forKey: "todoList") as? [String]{
        
        return todo
    } else {
        return nil
    }
    
}

