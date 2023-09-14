//
//  File.swift
//  
//
//  Created by SREININ on 14/9/23.
//

import Foundation
import UIKit


protocol StringConvertible {
    var rawValue: String {get}
}

protocol Instantiable: AnyObject {
    static var storyboardName: StringConvertible {get}
}

extension Instantiable {
  public  static func instantiateFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper()
    }
    
    private static func instantiateFromStoryboardHelper<T>() -> T {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}

//MARK: -

extension String: StringConvertible { // allow string as storyboard name
    var rawValue: String {
        return self
    }
}

//MARK: -

/** Storing storyboards' names */
enum StoryboardName: String, StringConvertible {
    case ProfileSB = "ProfileSB"
   
}


