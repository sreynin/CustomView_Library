//
//  File.swift
//  
//
//  Created by SREININ on 20/9/23.
//

import Foundation

public struct ProfileModel {
      var imgUrl    : String = ""
      var name      : String = ""
      var dateBirth : String = ""
      var phoneNum  : String = ""
      var addr      : String = ""
    public init(imgUrl:String,name:String,dateBirth: String,phoneNum: String,addr: String) {
        self.imgUrl    = imgUrl
        self.name      = name
        self.dateBirth = dateBirth
        self.phoneNum  = phoneNum
        self.addr      = addr
    }
}
