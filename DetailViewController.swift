//
//  DetailViewController.swift
//  Class Roster Part 5
//
//  Created by Kori Kolodziejczak on 8/25/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
  
  var personProfile: Person!
  var noPicImage = UIImage(named: "noPicHead.jpg")
  var gitHubResourcePath = "https://api.github.com/users/"
  var downloadURL = NSURL(string: "")
  var imageDownloadQueue = NSOperationQueue()
  var gitHubUserData = [String:String]()

  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var profileImage: UIImageView!
  @IBOutlet weak var gitHubUsername: UITextField!
  @IBOutlet weak var gitHubUserPic: UIImageView!
  

  @IBAction func gitPicClicked(sender: UIButton) {
    if gitHubUsername.text != nil {
    
      var alert = UIAlertController(title: "GitHub Account", message: "Enter Github Username", preferredStyle: UIAlertControllerStyle.Alert)
      var tempTextField: UITextField!
      
      
      alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
        textField.placeholder = "GitHub Username"
        tempTextField = textField!
      })
      
      alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
      alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) { (alertAction:UIAlertAction!) in
        
        self.gitHubUsername.text = tempTextField.text
        
        let getURL = NSURL(string: self.gitHubResourcePath + self.gitHubUsername.text)
        self.downloadURL = getURL

        
        
          let gitSession = NSURLSession.sharedSession()
          let gitTask = gitSession.dataTaskWithURL(self.downloadURL, completionHandler: { (data, response, error) -> Void in
            var JSONerr: NSError?

            var gitUserDict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &JSONerr) as NSDictionary
              println(gitUserDict)

            if let gitUserPicURL = gitUserDict["avatar_url"] as? String {
            }else {
              

            }

          })
          gitTask.resume()
          
        

        
        
        
        
        
        
        
      
      })
      
      self.presentViewController(alert, animated: true, completion: nil)
    }
  }

  @IBAction func photoButtonPressed(sender: AnyObject) {
    var pickerController = UIImagePickerController()
    
    pickerController.delegate = self
    pickerController.allowsEditing = true
    pickerController.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
    
    self.presentViewController(pickerController, animated: true, completion: nil)
    
  }
  
  func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
    picker.dismissViewControllerAnimated(true, completion: nil)
    var editedImage = info[UIImagePickerControllerEditedImage] as UIImage
    self.profileImage.image = editedImage
    self.personProfile.image = editedImage
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.firstNameTextField.text = personProfile.firstName
    self.lastNameTextField.text = personProfile.lastName
    self.gitHubUsername.text = personProfile.gitHubUserName
    self.profileImage.contentMode = UIViewContentMode.ScaleAspectFit
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.height / 2
    self.profileImage.clipsToBounds = true
    if personProfile.image == nil {
      self.profileImage.image = noPicImage
    }else{
      self.profileImage.image = personProfile.image
    }
  }

  
  
  
  
  
  
//MARK: viewDidAppear
  override func viewDidAppear(animated: Bool) {
    
  
  }
  
  
  
  
  
  
  
//MARK: viewWillAppear
  override func viewWillAppear(animated: Bool) {
    if let gitHubtemp = personProfile.gitHubUserName {
      self.gitHubUsername.text = personProfile.gitHubUserName
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func viewWillDisappear(animated: Bool) {
    personProfile.firstName = firstNameTextField.text
    personProfile.lastName = lastNameTextField.text
    personProfile.gitHubUserName = self.gitHubUsername.text
    println(self.gitHubUsername.text)
    personProfile.gitHubProfilePic = gitHubUserPic.image
    
  }
  

  
}
