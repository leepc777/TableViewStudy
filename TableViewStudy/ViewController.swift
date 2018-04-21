//
//  ViewController.swift
//  TableViewStudy
//
//  Created by Patrick on 4/20/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let colorSet = [["Section 0","Gold","Blue"],["Section 1","red","green","yellow"],["Section 3","grey","pink"]]
    
    let sectionHeader = ["this is section 0","this is section 1","this is section 2"]
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeader[section]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        print("DataSource is \(tableView.dataSource) and Delegate is \(tableView.delegate)")
        return colorSet.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("the current section \(section)")
        return colorSet[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        print(" indexPath is \(indexPath) and the row is \(indexPath.row)")

//        return UITableViewCell()
        let tableViewCell = UITableViewCell()
        tableViewCell.textLabel?.text = " indexPath:\(indexPath) row:\(indexPath.row) \(colorSet[indexPath.section][indexPath.row])"
        return tableViewCell
    }
}

