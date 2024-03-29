//
//  AddSpendController.swift
//  Budget Tracker
//
//  Created by Louise Reid on 19/06/2019.
//  Copyright © 2019 Louise Reid. All rights reserved.
//

import UIKit

protocol AddSpendViewControllerDelegate: class {
  
  func addSpendViewControllerDidCancel(_ controller: AddSpendViewController)
  
  func addSpendViewController(_ controller: AddSpendViewController, didFinishAdding item: SpendItem)
  
}

class AddSpendViewController: UIViewController {
  
  weak var delegate: AddSpendViewControllerDelegate?
  @IBOutlet weak var descriptionTextField: UITextField!
  @IBOutlet weak var valueTextField: UITextField!
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var container: UIView!
  
  override func viewDidLoad() {
    saveButton.isEnabled = false
    
    container.layer.borderWidth = 1
    container.layer.borderColor = #colorLiteral(red: 0.6872683167, green: 0.7037138343, blue: 0.4488055706, alpha: 1)
    container.layer.cornerRadius = 8.0
  }
  
  @IBAction func cancel(_ sender: Any) {
    delegate?.addSpendViewControllerDidCancel(self)
  }
  
  
  @IBAction func save(_ sender: Any) {
    
      let item = SpendItem()
      item.description = descriptionTextField.text!
      item.value = Double(valueTextField.text!)!
      delegate?.addSpendViewController(self, didFinishAdding: item)
  }
}

extension AddSpendViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    if let value = valueTextField.text{
      if !value.isEmpty {
        saveButton.isEnabled = true
      }
    }
    
    let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
    return string.rangeOfCharacter(from: invalidCharacters) == nil
    


  }
  
 
}
