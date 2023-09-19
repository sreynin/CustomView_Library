import Foundation
import UIKit

public struct CustomView_Library {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    public func showAlert(title: String, message: String,completion:@escaping()->Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alertController.addAction(okAction)
        
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
    public static func createProfileViewController() -> ProfileViewController {
        return ProfileViewController.instantiateFromStoryboard()
    }
    public static func createCustomView()-> UIView {
        return customView()
    }
}

@IBDesignable
public class customView:UIView {
    @IBInspectable lazy var isRoundRectView : Bool = false
    @IBInspectable lazy var isDashRound : Bool = false
    @IBInspectable public var cornerRadius : CGFloat = 0.0 {
        didSet{
            setUpView()
        }
    }
    
    @IBInspectable public var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var borderWidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var dashWidth : CGFloat = 0.0 {
        didSet {
            dashedBorder.lineWidth = dashWidth
        }
    }
    
    @IBInspectable var dashPaintedSize: Int = 2
    @IBInspectable var dashUnpaintedSize: Int = 2
    
    let dashedBorder = CAShapeLayer()
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
    
    func setUpView() {
        if isRoundRectView {
            self.layer.cornerRadius = self.bounds.height/2;
            self.clipsToBounds = true
        }
        else{
            self.layer.cornerRadius = self.cornerRadius;
            self.clipsToBounds = true
        }
        if isDashRound {
            applyDashBorder()
        }
    }
    
    func applyDashBorder() {
        dashedBorder.lineDashPattern = [NSNumber(value: dashPaintedSize), NSNumber(value: dashUnpaintedSize)]
        dashedBorder.backgroundColor = UIColor.clear.cgColor
        dashedBorder.fillColor = nil
        dashedBorder.strokeColor = borderColor.cgColor
        self.layer.addSublayer(dashedBorder)
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    public override func draw(_ rect: CGRect) {
        //Drawing code
        dashedBorder.path  = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
    }
    
}
