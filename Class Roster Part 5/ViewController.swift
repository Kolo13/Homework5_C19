//
//  ViewController.swift
//  Class Roster Part 5
//
//  Created by Kori Kolodziejczak on 8/25/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBAction func segueToAddVC(sender: AnyObject) {
    let indexPath = self.tableView.indexPathForSelectedRow()
    
    
  }
  
  @IBOutlet weak var tableView: UITableView!

  var allArray = [[Person]]()
  var sectionTitle = ["Students", "Teachers"]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
    
    if let tempArray = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [[Person]]{
      allArray = tempArray
    } else {
  
//      println("HELP")
//      var people = [Person]()
//      var teacher = [Person]()
//      var allArray = [[Person]]()
//      
//      var sectionTitle = ["Students", "Teachers"]
//      
//      var nathan = Person(firstName: "Nathan", lastName: "Ma")
//      var tuan = Person(firstName: "Tuan", lastName: "Vu")
//      var brian = Person(firstName: "Brian", lastName: "Mendez")
//      var brad = Person(firstName: "Brad", lastName: "Johnson")
//      var john = Person(firstName: "John", lastName: "Clum")
//      
//      
//      people = [nathan, tuan, brian]
//      teacher  = [brad, john]
//      allArray = [people, teacher]
//      
//      NSKeyedArchiver.archiveRootObject(allArray, toFile: documentsPath + "/archive")
    }
    
  }
  
  
  override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    if segue.identifier == "showDetail" {
      let indexPath = self.tableView.indexPathForSelectedRow()
      var destination = segue.destinationViewController as DetailViewController
      destination.personProfile = allArray[indexPath.section][indexPath.row]
      
    }else if segue.identifier == "showAddPerson" {
      var newDestination = segue.destinationViewController as DetailViewController
      var noPicImage = UIImage(named: "noPicHead")
      allArray[0].append(Person(firstName: "", lastName: ""))
      allArray[0][allArray[0].count-1].image = noPicImage
      newDestination.personProfile = allArray[0][allArray[0].count-1]
    }else{
    }
  }
  
  

  override func viewWillAppear(animated: Bool) {
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    NSKeyedArchiver.archiveRootObject(allArray, toFile: documentsPath + "/archive")
   
    tableView.reloadData()
  }
  
  func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
  }
  func tableView(tableView: UITableView!, editActionsForRowAtIndexPath indexPath: NSIndexPath!) -> [AnyObject]! { let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete")
    { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
      self.allArray[indexPath.section].removeAtIndex(indexPath.row)
      self.tableView.reloadData()
    }
    
    
    return [deleteAction]
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
    
    return cell
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
}

