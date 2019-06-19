//
//  AddSpendController.swift
//  Budget Tracker
//
//  Created by Louise Reid on 19/06/2019.
//  Copyright © 2019 Louise Reid. All rights reserved.
//

import UIKit

protocol AddSpendViewControllerDelegate: class {
  
  func addSpendViewController(_ controller: AddSpendViewController, didFinishAdding item: SpendItem)
  
}

class AddSpendViewController: UIViewController {
  
  weak var delegate: AddSpendViewControllerDelegate?
  
  @IBAction func cancel(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
}
