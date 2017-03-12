//
//  CreateContactViewController.swift
//  ContactsApp
//
//  Created by Roman Subrichak on 3/8/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class CreateContactViewController: UIViewController {

	@IBOutlet weak var imageView: UIImageView!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		//imageView.layer.borderWidth = 1.0
		
		imageView.layer.cornerRadius = imageView.frame.width / 2
		imageView.clipsToBounds = true
		
		let borderLayer  = dashedBorderLayerWithColor(color: UIColor(red:0.12, green:0.82, blue:0.36, alpha:1.0).cgColor)
		
		imageView.layer.addSublayer(borderLayer)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func saveTapped() {
		assertionFailure()
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

	
	private func dashedBorderLayerWithColor(color:CGColor) -> CAShapeLayer {
		
		let  borderLayer = CAShapeLayer()
		borderLayer.name = "borderLayer"
		let frameSize = imageView.frame.size
		let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
		borderLayer.bounds = shapeRect
		borderLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height / 2)
		borderLayer.fillColor = UIColor.clear.cgColor
		borderLayer.strokeColor = color
		borderLayer.lineWidth = 3
		borderLayer.lineJoin = kCALineJoinRound
		borderLayer.lineDashPattern = NSArray(array: [NSNumber(value:  8),NSNumber(value: 4)]) as? [NSNumber]
		
		let path = UIBezierPath.init(roundedRect: shapeRect, cornerRadius: borderLayer.frame.width / 2)
		
		borderLayer.path = path.cgPath
		
		return borderLayer
		
	}
}
