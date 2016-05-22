//
//  TableViewController.swift
//  CellButtons
//
//  Created by Jure Zove on 20/09/15.
//  Copyright © 2015 Candy Code. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 99
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ButtonCell", forIndexPath: indexPath) as! ButtonCell

    cell.rowLabel.text = "\(indexPath.row)"
    cell.tapAction = { (cell) in
      self.showAlertForRow(tableView.indexPathForCell(cell)!.row)
    }

    return cell
  }

  // MARK: - Extracted method

  func showAlertForRow(row: Int) {
    let alert = UIAlertController(
      title: "BEHOLD",
      message: "Cell at row \(row) was tapped!",
      preferredStyle: .Alert)
    alert.addAction(UIAlertAction(title: "Gotcha!", style: UIAlertActionStyle.Default, handler: { (test) -> Void in
      self.dismissViewControllerAnimated(true, completion: nil)
    }))

    self.presentViewController(
      alert,
      animated: true,
      completion: nil)
  }
}
