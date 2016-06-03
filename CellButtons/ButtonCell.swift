//
//  ButtonCell.swift
//  CellButtons
//
//  Created by Jure Zove on 20/09/15.
//  Copyright © 2015 Candy Code. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {
  var tapAction: ((UITableViewCell) -> Void)?

  @IBOutlet weak var rowLabel: UILabel!

  @IBAction func buttonTap(sender: AnyObject) {
    tapAction?(self)
  }
}
