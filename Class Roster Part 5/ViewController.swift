//
//  ViewController.swift
//  Class Roster Part 5
//
//  Created by Kori Kolodziejczak on 8/25/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  var people = [Person]()
  var teacher = [Person]()
  var allArray = [[Person]]()
  
  var sectionTitle = ["Students", "Teachers"]
  
  var nathan = Person(firstName: "Nathan", lastName: "Ma")
  var tuan = Person(firstName: "Tuan", lastName: "Vu")
  var brian = Person(firstName: "Brian", lastName: "Mendez")
  var brad = Person(firstName: "Brad", lastName: "Johnson")
  var john = Person(firstName: "John", lastName: "Clum")
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    people = [nathan, tuan, brian]
    teacher = [brad, john]
    allArray = [people, teacher]
    
    
    
  }
  override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    let indexPath = self.tableView.indexPathForSelectedRow()
    if segue.identifier == "pushDetail" {
      var destination = segue.destinationViewController as DetailViewController
      destination.personProfile = allArray[indexPath.section][indexPath.row]
      
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    
    tableView.reloadData()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    return self.allArray.count
  }
  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    return allArray[section].count
  }
  
  func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
    return sectionTitle[section]
  }
  
  func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    cell.textLabel.text = allArray[indexPath.section][indexPath.row].fullName()
    //    self.preProfile = allArray[indexPath.section][indexPath.row]
    
    return cell
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
}

