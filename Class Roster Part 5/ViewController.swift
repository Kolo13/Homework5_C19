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

  var tempArray = [[Person]]()
  var sectionTitle = ["Students", "Teachers"]


  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) [0] as String
    
    if let allArray = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [[Person]]{
      tempArray = allArray
      
      //NSKeyedArchiver.archiveRootObject(tempArray, toFile: documentsPath + "/archive")

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
      destination.personProfile = tempArray[indexPath.section][indexPath.row]
      
    }else if segue.identifier == "showAddPerson" {
      var newDestination = segue.destinationViewController as DetailViewController
      var noPicImage = UIImage(named: "noPicHead")
      tempArray[0].append(Person(firstName: "", lastName: ""))
      tempArray[0][tempArray[0].count-1].image = noPicImage
      newDestination.personProfile = tempArray[0][tempArray[0].count-1]
    }else{
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    NSKeyedArchiver.archiveRootObject(tempArray, toFile: documentsPath + "/archive")
   
    tableView.reloadData()
  }
  
  func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
    return self.tempArray.count
  }
  
  func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
    return tempArray[section].count
  }
  
  func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
    return sectionTitle[section]
  }
  
  
  func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
    var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    cell.textLabel.text = tempArray[indexPath.section][indexPath.row].fullName()
    
    return cell
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
}

