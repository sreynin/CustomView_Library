//
//  File.swift
//  
//
//  Created by SREININ on 19/9/23.
//

import Foundation
import UIKit

extension UIView {
 public func defaultNativeFeelingAnimation(scaleMeasurement: CGFloat, completion: ((Bool) -> Void)? = nil) {
        self.nativeFeelingAnimation(scaleMeasurement: scaleMeasurement) { (isDone) in
            self.nativeFeelingAnimation(completion: completion)
        }
    }
    /*
     * just scale in/out
     * scaleMeasurement = 1 ==> reset to default
     */
    public  func nativeFeelingAnimation(duration: TimeInterval = 0.1, scaleMeasurement: CGFloat = 1, highlightColor: UIColor? = nil, completion: ((Bool) -> Void)? = nil) {
        let measurement = (scaleMeasurement == 1) ? CGAffineTransform.identity : CGAffineTransform.identity.scaledBy(x: scaleMeasurement, y: scaleMeasurement)
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
            self.transform = measurement
            if let myHighlightColor = highlightColor, self.backgroundColor != myHighlightColor {
                self.backgroundColor = myHighlightColor
            }
        }, completion: completion)
    }
    public func fadeIn(_ duration: TimeInterval? = 0.2, onCompletion: (() -> Void)? = nil) {
        if self.isHidden {
            self.isHidden = false
        }
        if duration! > 0 {
            if self.alpha == 0 {
            self.alpha = 0
                UIView.animate(withDuration: duration!,
                               animations: { self.alpha = 1 },
                               completion: { (value: Bool) in
                                if let complete = onCompletion { complete() }
                               }
                )
            } else {
                if let complete = onCompletion { complete() }
            }
        } else {
            self.alpha = 1
            if let complete = onCompletion { complete() }
        }
    }
    
    public func fadeOut(_ duration: TimeInterval? = 0.2, isNeedHidden: Bool = true, onCompletion: (() -> Void)? = nil) {
        if duration! > 0 {
            UIView.animate(withDuration: duration!,
                           animations: { self.alpha = 0 },
                           completion: { (value: Bool) in
                            if isNeedHidden {
                                self.isHidden = true
                            }
                            if let complete = onCompletion { complete() }
                           }
            )
        } else {
            self.alpha = 0
            if isNeedHidden {
                self.isHidden = true
            }
            if let complete = onCompletion { complete() }
        }
    }
}
