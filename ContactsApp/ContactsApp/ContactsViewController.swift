//
//  ViewController.swift
//  ContactsApp
//
//  Created by Roman Subrichak on 2/27/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class ContactsViewController: UITableViewController {
	
	//MARK: - Properties
	var contactsDict = [String: [Contact]]() {
		didSet {
			if contactsDict.count != sectionNames.count {
				sectionNames =  contactsDict.keys.sorted()
			}
		}
	}
	var sectionNames = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()
		let contact = Contact(firstName: "John", lastName: "Adams", phoneNumber: "6764543577676", email: "adams@test.com", address: "1010 N San-Francisco ave", image: nil)
		contactsDict.updateValue([contact], forKey: "A")
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	//MARK: - Table View
	override func numberOfSections(in tableView: UITableView) -> Int {
		return sectionNames.count
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return sectionNames[section]
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let contacts = contactsDict[sectionNames[section]] {
			return contacts.count
		}
		return 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
		let contact = contactsDict[sectionNames[indexPath.section]]![indexPath.row]
		cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)"
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowDetailViewController" {
			if let cell = sender as? UITableViewCell {
				if let indexPath = tableView.indexPath(for: cell) {
					if let destinationVC = segue.destination as? DetailViewController {
						destinationVC.contactToDisplay = contactsDict[sectionNames[indexPath.section]]![indexPath.row]
					}
				}
			}
		}
	}
}

