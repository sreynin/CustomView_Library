//
//  ProfileViewController.swift
//  
//
//  Created by SREININ on 14/9/23.
//

import UIKit
import SDWebImage
public class ProfileViewController: UIViewController,Instantiable {
    public static var storyboardName: StringConvertible { StoryboardName.SettingSB}
 
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var birthTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

//MARK- Cusotm function -
extension ProfileViewController {
    func setup(){
        self.editBtn.layer.cornerRadius = 10
        self.profileImgView.clipsToBounds = true
        self.profileImgView.layer.cornerRadius  = 20
        self.profileImgView.sd_setImage(with: URL(string: "https://hips.hearstapps.com/hmg-prod/images/close-up-of-blossoming-rose-flower-royalty-free-image-1580853844.jpg"))
    }
}
