//
//  DetailViewController.swift
//  Class Roster Part 5
//
//  Created by Kori Kolodziejczak on 8/25/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  var personProfile: Person!
  var noPicImage = UIImage(named: "noPicHead")
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var profileImage: UIImageView!
  
  @IBAction func photoButtonPressed(sender: AnyObject) {
    var pickerController = UIImagePickerController()
    
    pickerController.delegate = self
    pickerController.allowsEditing = true
    pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    
    self.presentViewController(pickerController, animated: true, completion: nil)
    
  }
  
  func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
    picker.dismissViewControllerAnimated(true, completion: nil)
    var editedImage = info[UIImagePickerControllerEditedImage] as UIImage
    self.profileImage.contentMode = UIViewContentMode.ScaleAspectFit
    self.profileImage.image = editedImage
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstNameTextField.text = personProfile.firstName
    self.lastNameTextField.text = personProfile.lastName
    
    if personProfile.image == nil {
      self.profileImage.contentMode = UIViewContentMode.ScaleAspectFit
      self.profileImage.layer.cornerRadius = self.profileImage.frame.size.height / 2
      self.profileImage.clipsToBounds = true
      self.profileImage.image = noPicImage
    } else {
      self.profileImage.contentMode = UIViewContentMode.ScaleAspectFit
      self.profileImage.layer.cornerRadius = self.profileImage.frame.size.height / 2
      self.profileImage.clipsToBounds = true
      self.profileImage.image = personProfile.image
    }
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func viewWillDisappear(animated: Bool) {
    personProfile.firstName = firstNameTextField.text
    personProfile.lastName = lastNameTextField.text
    self.personProfile.image = self.profileImage.image
  }
  

  
}
