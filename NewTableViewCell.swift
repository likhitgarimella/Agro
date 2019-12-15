//
//  NewTableViewCell.swift
//  Agro
//
//  Created by Likhit Garimella on 14/12/19.
//  Copyright © 2019 Likhit Garimella. All rights reserved.
//

import UIKit

protocol TableViewNew {
    func onClickCell(index: Int)
}

class NewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    
    var cellDelegate: TableViewNew?
    var index: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonName(_ sender: UIButton) {
        
        cellDelegate?.onClickCell(index: (index?.row)!)
        
    }
    
}
