//
//  SettingViewController.swift
//  
//
//  Created by SREININ on 19/9/23.
//

import UIKit

class SettingViewController: UIViewController,Instantiable {
    public static var storyboardName: StringConvertible { StoryboardName.SettingSB}
    var dataSource : [String] = []
    //MARK: - ViewLifeCycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: -
extension SettingViewController :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
    }
    
    
}
