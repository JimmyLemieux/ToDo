//
//  ViewController.swift
//  ToDo
//
//  Created by James Lemieux on 2017-02-12.
//  Copyright © 2017 James Lemieux. All rights reserved.
//

import UIKit
import CoreText
import CoreGraphics
import CoreData

class ViewController: UITableViewController {
    var titles:[String] = [String]()
    var notes:[String] = [String]()
    var dataDict : [String:String] = [:]


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataDict["James"] = "Chewyfbdjfbdsjkfdbshfdsfbdsmfldsjkfbnds,ƒdsf"
        dataDict["Hello"] = "Ayyy"
        
        for(key,value) in dataDict {
            titles.append(key)
            notes.append(value)
        }
    
    
    }
    
    

    
    //MARK: ACTIONS
    
    @IBAction func addItem(_:Any){
        self.performSegue(withIdentifier: "add", sender: dataDict)
        
    }
    
    
    
    //MARK:Delegate Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainCell
        cell.titleLabel.text = titles[indexPath.row]
        cell.noteLabel.text = notes[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "add") {
             _ = segue.destination as! AddViewViewController;()
            
        }
        
        
    }
    
    
    
    

}

