//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Colors {
    static let brightLightGreen = UIColor(red: 0.23, green: 1.0, blue: 0.40, alpha: 1.0)
    static let shamrockGreen = UIColor(red: 0.06, green: 0.81, blue: 0.23, alpha: 1.0)
    static let emerald = UIColor(red: 0.0, green: 0.57, blue: 0.28, alpha: 1.0)
    static let darkGray01 = UIColor(red: 0.11, green: 0.13, blue: 0.18, alpha: 1.0)
    static let darkGray02 = UIColor(red: 0.19, green: 0.26, blue: 0.32, alpha: 1.0)
}

enum ButtonAssetsDirection {
    case titleImage
    case imageTitle
}

extension UIButton {
    func makeRoundCorners() {
        self.layer.cornerRadius = self.frame.size.height / 2.0
        self.layer.masksToBounds = true
    }
    
    func applyGradient(colors:[UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.frame
        
        gradientLayer.colors = colors.map { $0.cgColor }
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
 
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.makeRoundCorners()
    }

    private func titleImage() {
        let padding:CGFloat = 5.0
        
        if let tl = self.titleLabel {
            let tlSize = tl.frame.size
            let tlw = tlSize.width
            self.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: padding+tlw, bottom: 0.0, right: -tlw)
        }
        if let iv = self.imageView {
            let ivSize = iv.frame.size
            let ivw = ivSize.width
            self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -ivw, bottom: 0.0, right: padding+ivw)
        }
    }
    
    private func imageTitle() {
        let padding:CGFloat = 5.0
        if let iv = self.imageView {
            let ivSize = iv.frame.size
            let ivw = ivSize.width
            self.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -padding, bottom: 0.0, right: 0.0)
            
            self.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -ivw, bottom: 0.0, right: 0.0)
        }
    }
    
    func applyInsets(direction:ButtonAssetsDirection) {
        switch direction {
        case .imageTitle:
            self.imageTitle()
        case .titleImage:
            self.titleImage()
        }
    }
}

let f1 = CGRect(x: 0, y: 0, width: 100, height: 36)
let colors1:[UIColor] = [Colors.emerald, Colors.shamrockGreen, Colors.brightLightGreen]
let b1 = UIButton(frame: f1)
let i1 = UIImage(named: "group6")
b1.setTitle("share", for: .normal)
b1.setImage(i1, for: .normal)
b1.applyInsets(direction: .titleImage)
b1.applyGradient(colors: colors1)

let f2 = CGRect(x: 0, y: 0, width: 100, height: 36)
let colors2:[UIColor] = [Colors.darkGray02, Colors.darkGray01]
let b2 = UIButton(frame: f2)
let i2 = UIImage(named: "whoaIcon")
b2.setTitle("6.4k", for: .normal)
b2.setImage(i2, for: .normal)
b2.applyInsets(direction: .imageTitle)
b2.applyGradient(colors: colors2)


