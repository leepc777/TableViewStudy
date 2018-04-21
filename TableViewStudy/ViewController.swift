//
//  ViewController.swift
//  TableViewStudy
//
//  Created by Patrick on 4/20/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        print("DataSource is \(tableView.dataSource) and Delegate is \(tableView.delegate)")
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.dataSource = self
        tableView.delegate = self
        print("the current section \(section)")
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dataSource = self
        tableView.delegate = self

        print(" indexPath is \(indexPath) and the row is \(indexPath.row)")

//        return UITableViewCell()
        let tableViewCell = UITableViewCell()
        tableViewCell.textLabel?.text = " indexPath is \(indexPath) and row is \(indexPath.row)"
        return tableViewCell
    }
}

