//
//  CharityJSON.swift
//
//  Created by tridiak on 28/09/22.
//

import Foundation

struct CharityJSON : Codable {
	let CharityType : Int
	let ImageSource : URL
	let DarkModeImageSource : URL
	let Description : String
	let Tagline : String
}
