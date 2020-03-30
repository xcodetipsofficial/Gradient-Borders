//
//  ViewController.swift
//  GradientBorder
//
//  Created by Kyle Wilson on 2020-03-30.
//  Copyright © 2020 Xcode Tips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = GradientView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        imageView.image = UIImage(named: "xcodetipsprofile")
        
        view.addSubview(myView)
        myView.addSubview(imageView)
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myView.heightAnchor.constraint(equalToConstant: 100),
            myView.widthAnchor.constraint(equalToConstant: 100),
            
            imageView.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 40
    }
    
}

class GradientView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let path = UIBezierPath(roundedRect: self.bounds.insetBy(dx: 5, dy: 5), byRoundingCorners: [.topLeft, .bottomLeft, .topRight, .bottomRight], cornerRadii: CGSize(width: frame.size.height / 2, height: frame.size.height / 2))
        
        let gradient = CAGradientLayer()
        gradient.frame =  CGRect(origin: CGPoint.zero, size: frame.size)
        gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.colors = [UIColor.instaPurple.cgColor, UIColor.instaPink.cgColor, UIColor.instaOrange.cgColor]
        
        let shape = CAShapeLayer()
        shape.lineWidth = 5
        shape.path = path.cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        
        layer.insertSublayer(gradient, at: 0)
    }
}

extension UIColor { //Instagram Colors
    static let instaYellow = UIColor(red: 249/255, green: 218/255, blue: 132/255, alpha: 1.0)
    static let instaOrange = UIColor(red: 235/255, green: 132/255, blue: 59/255, alpha: 1.0)
    static let instaPink = UIColor(red: 197/255, green: 61/255, blue: 117/255, alpha: 1.0)
    static let instaPurple = UIColor(red: 138/255, green: 61/255, blue: 185/255, alpha: 1.0)
    static let instaBlue = UIColor(red: 80/255, green: 95/255, blue: 206/255, alpha: 1.0)
}

