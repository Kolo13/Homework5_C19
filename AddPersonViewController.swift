//
//  AddPersonViewController.swift
//  Class Roster Part 5
//
//  Created by Kori Kolodziejczak on 8/27/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
  
  var personToAdd: Person!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.firstName.text = self.personToAdd?.firstName
    self.lastName.text = personToAdd?.lastName
    
  }
  
  override func viewWillDisappear(animated: Bool) {
    self.personToAdd?.firstName = self.firstName.text
    self.personToAdd?.lastName = self.lastName.text
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
    
}
