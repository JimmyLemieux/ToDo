//
//  CalenderViewController.swift
//  ToDo
//
//  Created by James Lemieux on 2017-02-16.
//  Copyright © 2017 James Lemieux. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate {

    
    @IBOutlet var calView:UICollectionView!
    @IBOutlet var monthText:UILabel!
    
    var days = [String]()
    var months = ["January","Febuaray","March","April","May","June","July","August","September","October","November","December"]
    
    var bool = true
    var tempPath:IndexPath?
    
    var label:UILabel!
    var month:UILabel!
    
    var doneButton:UIButton!
    
    var monthInt : Int?
    var dayInt : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(CalenderViewController.swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight  = UISwipeGestureRecognizer(target: self, action:  #selector(CalenderViewController.swipe))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        calView.delegate = self
        calView.dataSource = self
        for i in 0...31{
            days.append("\(i)")
        }
        
        //The date
        let date = Date()
        let calender = Calendar.current
        
        monthInt = calender.component(.month, from: date) - 1
        let day = calender.component(.day, from: date)
        
        
        
        
        
        
        
        label = UILabel(frame: CGRect(x: self.view.bounds.width / 2, y: self.view.bounds.height / 8, width: 100, height: 20))
        label.adjustsFontSizeToFitWidth = true
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.layer.borderWidth = 0.8
        label.text = "\(day)"
        label.drawText(in: label.frame)
        self.view.addSubview(label)
        
        
        
        month = UILabel(frame: CGRect(x: self.view.bounds.width / 2 - 100, y: self.view.bounds.height/8, width: 100, height: 20))
        month.adjustsFontSizeToFitWidth = true
        month.layer.borderColor = UIColor.lightGray.cgColor
        month.layer.borderWidth = 0.8
        month.text = months[monthInt!]
        month.drawText(in: month.frame)
        self.view.addSubview(month)
        
        doneButton = UIButton(frame: CGRect(x: self.view.bounds.width/2 - 50, y: self.view.bounds.height - 100, width: 100, height: 20))
        doneButton.setTitle("Done Button", for: .normal)
        doneButton.tintColor = UIColor.black
        doneButton.setTitleColor(UIColor.black, for: .normal)
        doneButton.addTarget(self, action: Selector(("doneButton")), for: UIControlEvents.touchUpInside)
        self.view.bringSubview(toFront: doneButton)
        self.view.addSubview(doneButton)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Seg") {
            _ = segue.destination as! AddViewViewController
            print("Segged")
        }
    }
    
  
    
    
    func swipe(gesture:UISwipeGestureRecognizer) {
    
        
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Right")
            
        case UISwipeGestureRecognizerDirection.left:
            print("Left")
            monthInt = monthInt! + 1
            if(monthInt! == months.count){
                monthInt = 0
            }
            month.text = months[monthInt!]
            
            
        default:
            print("Heyooo")
        }
        
     
       
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.lightGray
        cell?.layer.borderWidth = 0.5
        cell?.layer.borderColor = UIColor.black.cgColor
        collectionView.deselectItem(at: indexPath, animated: true)
        label.text = days[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCalenderCell
        cell.labelText.text = days[indexPath.row]
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.opacity = 35
        collectionView.deselectItem(at: indexPath, animated: true)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {

        
        collectionView.deselectItem(at: indexPath, animated: false)
        
        return false
        
    }
 
  
    
    
    
    

}
