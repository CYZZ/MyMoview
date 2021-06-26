//
//  MoviewTableViewControllerMock.swift
//  MyMoviewTests
//
//  Created by CYZ on 2021/6/13.
//

@testable import MyMoview
import UIKit

class MoviewTableViewControllerMock: MoviesTableViewController {
	
	var isCallViewDidLoad:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
		isCallViewDidLoad = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
