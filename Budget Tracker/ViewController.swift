//
//  ViewController.swift
//  Budget Tracker
//
//  Created by Louise Reid on 18/06/2019.
//  Copyright © 2019 Louise Reid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var remainingBudget: UILabel!
  @IBOutlet weak var budgetTextField: UITextField!

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
    calculateBudget()
    
  }
  
  func calculateBudget(){
        let spendValues = spendList.items.map({(spend) -> Double in
          return spend.value
        })
        let totalSpent = spendValues.reduce(0){ (total, value) -> Double in
          return total + value
        }
    
        if let text = budgetTextField.text, !text.isEmpty {
          remainingBudget.text = "£" + String(format: "%.2f", Double(text)! - totalSpent)
        } else {
          remainingBudget.text = ""
        }
  }
  
  
  @IBAction func calculateBudget(_ sender: Any) {
    budgetTextField.resignFirstResponder()
    calculateBudget()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "AddSpendSegue" {
      if let addSpendViewController = segue.destination as? AddSpendViewController {
        addSpendViewController.delegate = self
      }
    }
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
      spendItemCell.spendValueText.text = "£" + String(format: "%.2f", item.value)
    }
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    let item = spendList.items[indexPath.row]
    spendList.remove(item, at: indexPath.row)
    tableView.deleteRows(at: [indexPath], with: .automatic)
    calculateBudget()
  }
}

extension ViewController: UITextFieldDelegate {
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
    return string.rangeOfCharacter(from: invalidCharacters) == nil
  }
  
}

extension ViewController: AddSpendViewControllerDelegate {
  func addSpendViewControllerDidCancel(_ controller: AddSpendViewController) {
    navigationController?.popViewController(animated: true)
  }
  
  func addSpendViewController(_ controller: AddSpendViewController, didFinishAdding item: SpendItem) {
    navigationController?.popViewController(animated: true)
    spendList.items.append(item)
    let rowIndex = spendList.items.count - 1
    let indexPath = IndexPath(row: rowIndex, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic)
    calculateBudget()
  }
  
}

