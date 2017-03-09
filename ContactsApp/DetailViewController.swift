//
//  DetailViewController.swift
//  ContactsApp
//
//  Created by Roman Subrichak on 3/6/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
	
	@IBOutlet weak var contactPhoto: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	
	var contactToDisplay: Contact!
	private var tableData = [(title: String, detail: String)]()
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.hidesBarsOnTap = true
		
		contactPhoto.layer.cornerRadius = self.contactPhoto.frame.size.width / 2
		contactPhoto.clipsToBounds = true
		
		tableView.tableFooterView = UIView(frame: CGRect.zero)
		tableView.backgroundColor = tableView.tableHeaderView?.backgroundColor
		
		nameLabel.textColor = .white
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.hidesBarsOnTap = false
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		
		fetchData()
    }
	
	func fetchData() {
		
		let fullname = contactToDisplay.firstName + " " + contactToDisplay.lastName
		nameLabel.text = fullname
		
		tableData.append((title: "phone:", detail: contactToDisplay.phoneNumber))
		
		if let email = contactToDisplay.email {
			tableData.append((title: "email:", detail: email))
		}
		if let address = contactToDisplay.address {
			tableData.append((title: "address:", detail: address))
		}
		if let imageName = contactToDisplay.image {
			contactPhoto.image = UIImage(named: imageName)
		} else {
			contactPhoto.image = UIImage(named: "user")
		}
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableData.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = tableData[indexPath.row].title
		cell.detailTextLabel?.text = tableData[indexPath.row].detail
		return cell
	}
}
