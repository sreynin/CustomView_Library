//
//  ProfileViewController.swift
//  
//
//  Created by SREININ on 14/9/23.
//

import UIKit

public class ProfileViewController: UIViewController,Instantiable {
    static var storyboardName: StringConvertible { StoryboardName.ProfileSB}
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    public func loadVC()->ProfileViewController{
        ProfileViewController.instantiateFromStoryboard()
    }

  

}
