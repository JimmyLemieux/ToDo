//
//  AddViewViewController.swift
//  ToDo
//
//  Created by James Lemieux on 2017-02-12.
//  Copyright © 2017 James Lemieux. All rights reserved.
//

import UIKit

class AddViewViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var titleField:UITextField? = nil
    var noteField:UITextField? = nil
    
    var pickerView:UIPickerView? = nil
    
    var months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    var days = [String]()
    var years = ["2017","2018"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        titleField = UITextField(frame: CGRect(x:self.view.bounds.width/2 - self.view.bounds.width/2 , y: self.view.bounds.height/2 - self.view.bounds.height/2.6, width: self.view.bounds.width, height: 50))
        titleField?.delegate = self
        titleField?.placeholder = "Enter Text Here"
        titleField?.borderStyle = .roundedRect
        titleField?.backgroundColor = UIColor.lightGray
        titleField?.autocapitalizationType = .allCharacters
        titleField?.autocorrectionType = .default
        titleField?.keyboardType = .default
        titleField?.clearButtonMode = .whileEditing
        titleField?.resignFirstResponder()
        self.view.addSubview(titleField!)
        
        
        noteField = UITextField(frame: CGRect(x: self.view.bounds.width/2 - self.view.bounds.width/2, y: self.view.bounds.height/2 - self.view.bounds.height / 3.4, width: self.view.bounds.width, height: 50))
        noteField?.delegate = self
        noteField?.placeholder = "Enter you task here"
        noteField?.borderStyle = .roundedRect
        noteField?.backgroundColor = UIColor.lightGray
        noteField?.autocorrectionType = .default
        noteField?.keyboardType = .asciiCapable
        noteField?.clearButtonMode = .whileEditing
        noteField?.resignFirstResponder()
        self.view.addSubview(noteField!)
        
        
        
        //Add a button with image associated with it
//        let button = UIButton(type: .roundedRect)
//        button.bounds = CGRect(x: self.view.bounds.width/2, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
        
        
        
        
        //The picker view thing
        pickerView = UIPickerView(frame: CGRect(x: self.view.bounds.width/2 - self.view.bounds.width/2, y: self.view.bounds.height/2 - self.view.bounds.height/5.5, width: self.view.bounds.width, height: self.view.bounds.height/2.7))
        pickerView?.sizeToFit()
        pickerView?.delegate = self
        pickerView?.dataSource = self
        pickerView?.contentMode = .center
        pickerView?.layer.borderWidth = 5
        pickerView?.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(pickerView!)
        
      
        days.removeAll()
        for i in 1...31 {
            days.append("\(i)")
        }
        
        
    }

   
    @IBAction func doneButton(_:Any){
        
        let segue = UIStoryboardSegue(identifier: "Done", source: self, destination: ViewController())
        

        
    }
   
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "Done"){
            
            print(segue.identifier!)
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return")
        titleField?.resignFirstResponder()
        noteField?.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 12
        case 1:
            return 31
        case 2:
            return 2
        default:
            return 0
        }
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return months[row]
        case 1:
            return days[row]
        case 2:
            return years[row]
        default:
            return "null"
        }

    
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        //Start the animation here!!
        startAnimation()
    }
    
    func startAnimation() {
        UIView.animate(withDuration: 0.5) {
            
        }
        
    }



}
