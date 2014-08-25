//
//  Person.swift
//  Class Roster Part 5
//
//  Created by Kori Kolodziejczak on 8/25/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import Foundation
import UIKit

class Person {
  
  var firstName: String
  var lastName: String
  var image: UIImage?
  
  init (firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  func fullName () -> String {
    return self.firstName + " " + self.lastName
  }
  
}

