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
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateBirthLbl: UILabel!
    @IBOutlet weak var phoneNumLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    //MARK: - Variable
    var imgUrl : String = ""
    var nameStr: String = ""
    var datebirthStr: String = ""
    var phoneNum: String = ""
    var addressStr: String = ""
    
    //MARK: - View lifeCycle -
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    @IBAction func settingBtnAction(_ sender: UIButton) {
        let vc = SettingViewController.instantiateFromStoryboard() 
        vc.dataSource = ["Update Phone Number","View Profile Picture","Edit Address"]
        vc.detailImg = "icoSeemore"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Cusotm function -
extension ProfileViewController {
    func setup(){
        self.profileImgView.clipsToBounds       = true
        self.profileImgView.layer.cornerRadius  = 70
        self.profileImgView.sd_setImage(with: URL(string: self.imgUrl))
        self.nameLbl.text       = self.nameStr
        self.dateBirthLbl.text  = self.datebirthStr
        self.phoneNumLbl.text   = self.phoneNum
        self.addressLbl.text    = self.addressStr
    }
    
}
