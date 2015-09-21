# Buttoned up Cells

Table views and collections are awesome, right? We're all pretty much used to customizing cells but every once in a while, we need to go one step further and add a button to the table view cell.

The fastest way to accomplish this is to introduce a protocol in your code. Like this
````
protocol ButtonCellDelegate {
    func cellTapped(cell: ButtonCell)
}
````
Now that there's a protocol in place, we have to define a ButtonCellDelegate variable in our custom table view cell. I'm assuming we already have the button's action linked to the custom cell:
````
class ButtonCell: UITableViewCell {
    
    var buttonDelegate: ButtonCellDelegate?
    
    @IBAction func buttonTap(sender: AnyObject) {
        if let delegate = buttonDelegate {
            delegate.cellTapped(self)
        }
    }

}
````
The delegate in the upper piece of code is in our case the table view controller. Here's how we assign the delegate in the cellForRowAtIndexPath
````
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ButtonCell", forIndexPath: indexPath) as! ButtonCell

    if cell.buttonDelegate == nil {
      cell.buttonDelegate = self
    }

    return cell
  }
````
Of course, we need to implement the protocol's method in the table view controller
````
//
//  TableViewController.swift
//  CellButtons
//
//  Created by Jure Zove on 20/09/15.
//  Copyright © 2015 Candy Code. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ButtonCellDelegate {

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
        if cell.buttonDelegate == nil {
            cell.buttonDelegate = self
        }

        return cell
    }
    
    // MARK: - ButtonCellDelegate
    
    func cellTapped(cell: ButtonCell) {
        self.showAlertForRow(tableView.indexPathForCell(cell)!.row)
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
````
Subscribe here if you'de like more stuff like this -> [Candy Code](http://candycode.io)

Happy coding!
