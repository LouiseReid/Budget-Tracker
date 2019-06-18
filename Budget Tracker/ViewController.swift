//
//  ViewController.swift
//  Budget Tracker
//
//  Created by Louise Reid on 18/06/2019.
//  Copyright © 2019 Louise Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  

  @IBOutlet weak var tableView: UITableView!
  var spendList: SpendList
  
  required init?(coder aDecoder: NSCoder) {
    spendList = SpendList()
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.delegate = self
    self.tableView.dataSource = self
    print(spendList.items.count)
  }
  

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return spendList.items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SpendItem", for: indexPath)
    let item = spendList.items[indexPath.row]
    configureText(for: cell, with: item)
    return cell
  }
  
  func configureText(for cell:UITableViewCell, with item: SpendItem){
    if let spendItemCell = cell as? SpendItemTableViewCell {
      spendItemCell.spendDescriptionText.text = item.description
      spendItemCell.spendValueText.text = "£\(item.value)"
    }
  }
  
}

