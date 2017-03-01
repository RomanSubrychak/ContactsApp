//
//  ViewController.swift
//  ContactsApp
//
//  Created by Roman Subrichak on 2/27/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	
	//MARK: - Properties
	var names = [String: [String]]() {
		didSet {
			if names.count != sectionNames.count {
				sectionNames =  names.keys.sorted()
			}
		}
	}
	var sectionNames = [String]()

	override func viewDidLoad() {
		super.viewDidLoad()
		names.updateValue(["Allen", "Adams"], forKey: "A")
		names.updateValue(["Cartner", "Cormen","Camel"], forKey: "C")
		
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
		if let contacts = names[sectionNames[section]] {
			return contacts.count
		}
		return 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
		cell.textLabel?.text = (names[sectionNames[indexPath.section]]!)[indexPath.row]
		return cell
	}
	

}

