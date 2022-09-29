//
//  PromotionsJSON.swift
//
//  Created by tridiak on 28/09/22.
//

import Foundation

struct PromoJSON : Codable {
	let Id : Int
	let Name : String?
	let Description : String?
	let Price : Double?
	let OriginalPrice : Double?
	let MinimumPhotoCount : Int?
	let GoodFor2RelistsFee : Double?
	
}
