//
//  Person.swift
//  Class Roster Part 5
//
//  Created by Kori Kolodziejczak on 8/25/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

import Foundation
import UIKit

class Person: NSObject, NSCoding {
  
  var firstName: String
  var lastName: String
  var image: UIImage?
  var gitHubUserName: String?
  var gitHubProfilePic: UIImage?
  

  init (firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  func fullName () -> String {
    return self.firstName + " " + self.lastName
  }
  
  required init (coder aDecoder: NSCoder) {
    self.firstName = aDecoder.decodeObjectForKey("firstName") as String
    self.lastName = aDecoder.decodeObjectForKey("lastName") as String
    
    if let myGitHubUserName = aDecoder.decodeObjectForKey("myGitHubUserName") as? String {
      self.gitHubUserName = myGitHubUserName
    }
    if let myImage = aDecoder.decodeObjectForKey("myImage") as? UIImage {
      self.image = myImage
    }
    super.init()
  }
  
  func encodeWithCoder(aCoder: NSCoder)  {
    aCoder.encodeObject(self.firstName, forKey: "firstName")
    aCoder.encodeObject(self.lastName, forKey: "lastName")
    
   if self.gitHubUserName != nil {
      aCoder.encodeObject(self.gitHubUserName!, forKey: "myGitHubUserName")
    }
    if self.image != nil {
      aCoder.encodeObject(self.image!, forKey: "myImage")
    }
  }

}