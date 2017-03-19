//
//  CreateContactViewController.swift
//  ContactsApp
//
//  Created by Roman Subrichak on 3/8/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class CreateContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
    @IBOutlet weak var hintLabel: UILabel!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var editButton: UIButton!
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var addButton: AddButtonView!
	@IBOutlet weak var companyTextField: UITextField!
	@IBOutlet weak var phoneNumberTextField: UITextField!
	@IBOutlet weak var addressTextView: UITextView!
	@IBOutlet weak var emailTextField: UITextField!
	
	var contact: Contact?
	
	var borderLayer: CAShapeLayer!
	
	@IBAction func editButton(_ sender: Any) {
		addPhoto()
	}
	
	@IBAction func addTapped(_ sender: Any) {
		addPhoto()
	}
	
	func addPhoto() {
		let ac = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
		ac.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: choosePhoto))
		ac.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: takePhoto))
		ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		present(ac, animated: true)
	}
	
	func choosePhoto(action: UIAlertAction!) {
		let picker = UIImagePickerController()
		picker.allowsEditing = true
		picker.delegate = self
		present(picker, animated: true)
	}
	
	func takePhoto(action: UIAlertAction!) {
	
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		addressTextView.layer.borderWidth = 1
		addressTextView.layer.borderColor = UIColor.gray.cgColor
		addressTextView.layer.cornerRadius = 7.0
		
		imageView.layer.cornerRadius = imageView.frame.width / 2
		imageView.clipsToBounds = true
		
		editButton.isHidden = true
		
		if imageView.image == nil {
			borderLayer  = dashedBorderLayerWithColor(color: UIColor(red:0.12, green:0.82, blue:0.36, alpha:1.0).cgColor)
			imageView.layer.addSublayer(borderLayer)
		} else {
			hintLabel.isHidden = true
			addButton.isHidden = true
			editButton.isHidden = false
		}
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
		navigationItem.rightBarButtonItem?.isEnabled = false
		
		firstNameTextField.text = contact?.firstName
		lastNameTextField.text = contact?.lastName
		companyTextField.text = contact?.company
		phoneNumberTextField.text = contact?.phoneNumber
		emailTextField.text = contact?.email
		addressTextView.text = contact?.address
		imageView.image = UIImage(named: contact?.image ?? "")
		
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
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
		guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
			return
		}
		
		setImage(image)
		
		let imageName = UUID().uuidString
		let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)
		
		if let jpegData = UIImageJPEGRepresentation(image, 80) {
			try? jpegData.write(to: imagePath)
		}
		contact?.image = imagePath.path
		dismiss(animated: true)
	}
	
	func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		let documentsDirectory = paths[0]
		return documentsDirectory
	}
	
	func setImage(_ image: UIImage) {
		imageView.image = image
		borderLayer.removeFromSuperlayer()
	}
}
