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
    //MARK: - IBOutlet -
  
    @IBOutlet weak var profileImgView: UIImageView!

    //MARK: - View lifeCycle -
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Cusotm function -
extension ProfileViewController {
    func setup(){
        self.profileImgView.clipsToBounds = true
        self.profileImgView.layer.cornerRadius  = 70
        self.profileImgView.sd_setImage(with: URL(string: "https://hips.hearstapps.com/hmg-prod/images/close-up-of-blossoming-rose-flower-royalty-free-image-1580853844.jpg"))
    }
}
