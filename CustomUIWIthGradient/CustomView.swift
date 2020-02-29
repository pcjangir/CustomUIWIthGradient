//
//  CustomView.swift
//  CustomUIWIthGradient
//
//  Created by Poonam on 01/03/20.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        drawShape()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        drawShape()

    }
    
    private func drawShape() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: self.frame.size.height/2))
        path.addQuadCurve(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
                          controlPoint: CGPoint(x: self.frame.size.width/4, y: self.frame.size.height/2 - 50))
        path.addQuadCurve(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/2 - 200),
                          controlPoint: CGPoint(x: (self.frame.size.width/2 + self.frame.size.width/4)-50 , y: self.frame.size.height/2 - 100 - 50))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height/2))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [UIColor.magenta.cgColor, UIColor.cyan.cgColor]
        gradient.mask = shapeLayer
        self.layer.addSublayer(gradient)

    }

}
