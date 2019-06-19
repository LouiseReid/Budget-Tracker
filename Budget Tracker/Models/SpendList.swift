//
//  SpendList.swift
//  Budget Tracker
//
//  Created by Louise Reid on 18/06/2019.
//  Copyright © 2019 Louise Reid. All rights reserved.
//

import Foundation

class SpendList {
  
  var items: [SpendItem] = []
  
  init() {
//    let row0Spend = SpendItem()
//    let row1Spend = SpendItem()
//    let row2Spend = SpendItem()
//    let row3Spend = SpendItem()
//    let row4Spend = SpendItem()
//    
//    row0Spend.description = "Tesco Shop"
//    row0Spend.value = 30.50
//    
//    row1Spend.description = "Train Pass"
//    row1Spend.value = 16.50
//    
//    row2Spend.description = "McDonalds"
//    row2Spend.value = 5.60
//    
//    row3Spend.description = "Petrol"
//    row3Spend.value = 15.00
//    
//    row4Spend.description = "Gym"
//    row4Spend.value = 10.00
//    
//    items.append(row0Spend)
//    items.append(row1Spend)
//    items.append(row2Spend)
//    items.append(row3Spend)
//    items.append(row4Spend)
  }
  
  func remove(_ item: SpendItem, at index: Int) {
    items.remove(at: index)
  }
}
