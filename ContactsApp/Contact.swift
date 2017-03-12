//
//  Contact.swift
//  ContactsApp
//
//  Created by Roman Subrichak on 3/1/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import Foundation

class Contact {
	var firstName: String
	var lastName: String
	var phoneNumber: String
	var company: String?
	var email: String?
	var address: String?
	var image: String?
	
	init(firstName: String, lastName: String, phoneNumber: String, email: String?, address: String?, image: String?) {
		self.firstName = firstName
		self.lastName = lastName
		self.phoneNumber = phoneNumber
		self.email = email
		self.address = address
		self.image = image
	}
}
