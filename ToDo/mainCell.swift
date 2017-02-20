//
//  mainCell.swift
//  ToDo
//
//  Created by James Lemieux on 2017-02-12.
//  Copyright © 2017 James Lemieux. All rights reserved.
//

import UIKit

class mainCell: UITableViewCell {

    
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var noteLabel:UILabel!
    
    override func awakeFromNib() {

        titleLabel.font = UIFont(name: "Arial", size: 20)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.drawText(in: CGRect(x: self.bounds.width/2, y: self.bounds.height/2, width: 20, height: 5))
        titleLabel.highlightedTextColor = UIColor.blue
        
        noteLabel.sizeToFit()
        noteLabel.font = UIFont(name:"Arial", size:10)
        noteLabel.highlightedTextColor = UIColor.green
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
