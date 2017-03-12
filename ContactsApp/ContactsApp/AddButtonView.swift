//
//  PushButtonView.swift
//  ContactsApp
//
//  Created by Roman Subrichak on 3/9/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit


@IBDesignable
class AddButtonView: UIButton {


    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
	
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
		UIColor(red: 0.10, green: 1.00, blue: 0.64, alpha:1.0).setFill()
		path.fill()
		
		//set up the width and height variables
		//for the horizontal stroke
		
		let plusHeight: CGFloat = 5.0
		let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
		
		//create the path
		let plusPath = UIBezierPath()
		
		//set the path's line width to the height of the stroke
		
		plusPath.lineWidth = plusHeight
		
		//move the initial point of the path
		//to the start of the horizontal stroke
		
		plusPath.move(to: CGPoint(x: bounds.width / 2 - plusWidth / 2 + 0.5, y: bounds.height / 2 + 0.5))
		
		//add a point to the path at the end of the stroke
		plusPath.addLine(to: CGPoint(x: bounds.width / 2 + plusWidth / 2 + 0.5, y: bounds.height / 2 + 0.5))
		
		//Vertical Line
		
		//move to the start of the vertical stroke
		plusPath.move(to: CGPoint(x: bounds.width / 2 + 0.5,
		                          y: bounds.height / 2 - plusWidth / 2 + 0.5))
		//add the end point to the vertical stroke
		plusPath.addLine(to: CGPoint(x: bounds.width / 2 + 0.5,
		                             y: bounds.height / 2 + plusWidth / 2 + 0.5 ))
		
		//set the stroke color
		UIColor.white.setStroke()
		
		//draw the stroke
		plusPath.stroke()
		

		
    }

}
