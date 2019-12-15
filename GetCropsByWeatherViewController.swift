//
//  GetCropsByWeatherViewController.swift
//  Agro
//
//  Created by Likhit Garimella on 14/12/19.
//  Copyright © 2019 Likhit Garimella. All rights reserved.
//

import UIKit

var list = ["Banana", "Coffee", "Cotton", "Maize", "Potato", "Rice", "Tea", "Wheat"]

class GetCropsByWeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewNew {
    
    
    func onClickCell(index: Int) {
        print("\(index) is Clicked")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewTableViewCell
        cell?.labelName.text = list[indexPath.row]
        cell?.cellDelegate = self
        cell?.index = indexPath
        return cell!
    }
    
    

    @IBOutlet weak var myTableView: UITableView!
    
    /* public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list.count)
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            list.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    } */
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
