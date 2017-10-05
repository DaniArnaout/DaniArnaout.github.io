//
//  TableViewController.swift
//  Complex
//
//  Created by Dani Arnaout on 10/4/17.
//  Copyright © 2017 Abstract Layer. All rights reserved.
//

import UIKit
import AbstractLayer

class TableViewController: UITableViewController {
  
  //
  // MARK: Lazy load
  //
  private lazy var today:Double = {
    var calendar = NSCalendar.current
    calendar.timeZone = NSTimeZone(abbreviation: "UTC")! as TimeZone
    return calendar.startOfDay(for: Date()).timeIntervalSince1970
  }()
  
  private lazy var yesterday:Double = {
    var calendar = NSCalendar.current
    calendar.timeZone = NSTimeZone(abbreviation: "UTC")! as TimeZone
    return calendar.startOfDay(for: Date().addingTimeInterval(-86400)).timeIntervalSince1970
  }()
  
  //
  // MARK: Table view datasource
  //
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let table = tableView as! ALTableView
    
    if (indexPath.section == 0) {
      return table.cellForRow(at: indexPath)!
    }
    
    let cell = table.cellForRow(at: indexPath) as! CustomTableViewCell
    
    // Get item info
    let array = table.array[1] as! [[String:Any]]
    let item = array[indexPath.row] // Get item dictionary
    let timestamp = item["timestamp"] as! Double
    
    // Date calculations
    if timestamp > today {
      cell.dateLabel?.text = "Today"
    } else if timestamp > yesterday {
      cell.dateLabel?.text = "Yesterday"
    }
    
    return cell
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return tableView.numberOfSections
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableView.numberOfRows(inSection: section)
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let table = tableView as! ALTableView
    return table.heightForRow(at: indexPath)
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let table = tableView as! ALTableView
    return table.viewForHeader(inSection: section)
  }

}
