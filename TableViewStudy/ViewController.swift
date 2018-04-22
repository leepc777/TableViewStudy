//
//  ViewController.swift
//  TableViewStudy
//
//  Created by Patrick on 4/20/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ====== setup the arrays for populating tableView and header Text
    
    var colorSet = [["Purple","Gold","Blue"],["brown","red","green","yellow"],["orange","grey","pink"]]
    
    let sectionHeader = ["Header at section 0","Header at section 1","Header at section 2"]

    //========= IBOutlet and Action
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBAction func sortNRefresh(_ sender: UIButton) {
        colorSet[0].sort()
        print("after sorting: \(colorSet)")
        myTableView.reloadData() //reload whole table
        myTableView.reloadSections([0], with: .fade) // reload only section
        let indexPath = IndexPath(row: 0, section: 0)
        var indexPathArray = [IndexPath(row: 0, section: 0),IndexPath(row: 1, section: 1)]
        myTableView.reloadRows(at: indexPathArray, with: UITableViewRowAnimation.left)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }

    
  
    // ===========  setup the Title of Section Header

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("create section header")
        return sectionHeader[section]
    }
    
}

extension ViewController : UITableViewDataSource {
    
    // ===========  how many sections  ? =======
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        print("DataSource is \(tableView.dataSource) and Delegate is \(tableView.delegate)")
        return colorSet.count
    }
    
    // ===========  how many rows in each section ? =====
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("# of Rows:\(colorSet[section].count) in section \(section)")
        return colorSet[section].count
    }
    
    // ======== create a cell to display at indexPath.row
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAt indexPath:\(indexPath) row:\(indexPath.row)")
        
        //        return UITableViewCell()
        let tableViewCell = UITableViewCell()
        tableViewCell.textLabel?.text = " indexPath:\(indexPath) section:\(indexPath.section) row:\(indexPath.row) \(colorSet[indexPath.section][indexPath.row])"
        return tableViewCell
    }

}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "goDetail", sender: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "detailVC")
        navigationController?.pushViewController(nextVC, animated: true)
        
//        let nextVC = storyboard?.instantiateViewController(withIdentifier: "detailVC")
//        navigationController?.pushViewController(nextVC!, animated: true)
//        present(nextVC!, animated: true, completion: nil)
    }
}

