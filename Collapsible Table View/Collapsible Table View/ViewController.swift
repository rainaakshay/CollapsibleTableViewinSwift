//
//  ViewController.swift
//  Collapsible Table View
//
//  Created by apple on 29/12/18.
//  Copyright © 2018 Seraphic. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var productsTable: UITableView!
  
    struct expandNames {
        var isExpanded : Bool
        var names : [String]
    }

    var sectionNames : [String] = ["iPhones","iPads","iMacs","iPods","iWatches","MacBooks","Accessories"]
    
    var iphoneNames : [String] = ["iPhoneXS","iPhone XR","iPhone X","iPhone 7","iPhone 6s","iPhone 6","iPhone 5s","iPhone 5","iPhone 4s","iPhone 4"]
    var iPadNames : [String] = ["iPad Pro 17 Retina\"","iPad Pro 17\"","iPad Pro 13\"","iPad Mini"]
    var imacNames : [String] = ["iMac Pro 2018", "iMac Pro 2016", "iMac Mini 2016"]
    var ipodNames : [String] = ["iPod Touch 2016", "iPod Nano 2016","iPod Shuffle"]
    var iwatchNames : [String] = ["iWatch Series 1","iWatch Series 2","iWatch Series 3"]
    var macbookNames : [String] = ["Macbook Pro 2018", "Macbook Air 2018", "Macbook Pro 2017", "Macbook Pro 2016", "Macbook Air 2016"]
    var accessoriesNames : [String] = ["Magic Mouse","Earphones", "iPhone Cases","Chargers","TypeC to 3.5mm Converter"]

    
    var sectionDetails : [[String]] = [["iPhoneXS","iPhone XR","iPhone X","iPhone 7","iPhone 6s","iPhone 6","iPhone 5s","iPhone 5","iPhone 4s","iPhone 4"],["iPad Pro 17 Retina'","iPad Pro 17'","iPad Pro 13'","iPad Mini"],["iMac Pro 2018", "iMac Pro 2016", "iMac Mini 2016"],["iPod Touch 2016", "iPod Nano 2016","iPod Shuffle"],["iWatch Series 1","iWatch Series 2","iWatch Series 3"],["Macbook Pro 2018", "Macbook Air 2018", "Macbook Pro 2017", "Macbook Pro 2016", "Macbook Air 2016"],["Magic Mouse","Earphones", "iPhone Cases","Chargers","TypeC to 3.5mm Converter"]]
    
    var selectedSection = Int()
    
    var isExpanded : [Bool] = [true,true,true,true,true,true,true]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        productsTable.delegate = self
        productsTable.dataSource = self
        productsTable.estimatedRowHeight = 50
        productsTable.rowHeight = UITableView.automaticDimension
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isExpanded[section] == false
        {
          return 0
        }
      
        return sectionDetails[section].count
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = productsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.itemName.text = ""
        
        selectedSection = indexPath.section
        
        if selectedSection == 0
        {
            cell.itemName.text = iphoneNames[indexPath.item]
        }
        if selectedSection == 1
        {
            cell.itemName.text = iPadNames[indexPath.item]
        }
        if selectedSection == 2
        {
            cell.itemName.text = imacNames[indexPath.item]
        }
        if selectedSection == 3
        {
            cell.itemName.text = ipodNames[indexPath.item]
        }
        if selectedSection == 4
        {
            cell.itemName.text = iwatchNames[indexPath.item]
        }
        if selectedSection == 5
        {
            cell.itemName.text = macbookNames[indexPath.item]
        }
        if selectedSection == 6
        {
            cell.itemName.text = accessoriesNames[indexPath.item]
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
    let button = UIButton()
        
        button.setTitleColor(UIColor.black , for: .normal)
        button.addTarget(self, action: #selector(expandandclose), for: .touchUpInside)
        button.tag = section
        button.backgroundColor = UIColor.lightGray
        if button.tag == 0
        {
            button.setTitle("Iphones", for: .normal)
        }
        if button.tag == 1
        {
            button.setTitle("Ipads", for: .normal)
        }
        if button.tag == 2
        {
            button.setTitle("Imacs", for: .normal)
        }
        if button.tag == 3
        {
            button.setTitle("Ipods", for: .normal)
        }
        if button.tag == 4
        {
            button.setTitle("Iwatches", for: .normal)
        }
        if button.tag == 5
        {
            button.setTitle("Macbooks", for: .normal)
        }
        if button.tag == 6
        {
            button.setTitle("Accessories", for: .normal)
        }
     
        return button
    }
    
    
    
    @objc func expandandclose(button : UIButton)
    {
        
       let section = button.tag
        
       var indexes = [IndexPath]()
     
        if isExpanded[section] == true
        {
            for items in 0..<sectionDetails[section].count{
                let indexPath = IndexPath(row: items, section: section)
                indexes.append(indexPath)
            }
          sectionDetails[section].removeAll()
            productsTable.deleteRows(at: indexes, with: .automatic)
            isExpanded[section] = false

        }
            
        else
        {
           
            isExpanded[section]=true
            if section == 0
            {
                sectionDetails[section] = iphoneNames
                
                fillRows(section: section)
            }
            
            if section == 1
            {
                sectionDetails[section] = iPadNames

                fillRows(section: section)
            }
            if section == 2
            {
                sectionDetails[section] = imacNames

                fillRows(section: section)
            }
            if section == 3
            {
                sectionDetails[section] = ipodNames

                fillRows(section: section)
            }
            if section == 4
            {
                sectionDetails[section] = iwatchNames

                fillRows(section: section)
            }
            if section == 5
            {
                sectionDetails[section] = macbookNames

                fillRows(section: section)
            }
            if section == 6
            {
                sectionDetails[section] = accessoriesNames

                fillRows(section: section)
            }
        }
       }
        
   
    func fillRows(section: Int){
        var indexes = [IndexPath]()
        for items in 0..<sectionDetails[section].count{
            let indexPath = IndexPath(row: items, section: section)
            indexes.append(indexPath)
        }
        productsTable.insertRows(at: indexes, with: .top)
    }
    
    
    


}

