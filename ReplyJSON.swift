//
//  ReplyJSON.swift
//
//  Created by tridiak on 28/09/22.
//

import Foundation
/*
 Struct hierarchy
 ReplyJSON
 |-	FeesJSON
 |	|-	SuccessTiersJSON array
 |-	CharityJSON array
 |-	PromoJSON array
 
 Also a weird issue, fields of the Double type needs to be set to optional or the JSON parser
 can throw an exception. Not sure why it does this.
 */

// Root struct.
struct ReplyJSON : Codable {
	let CategoryId : Int
	let Name : String
	let Path : String
	let CanListAuctions : Bool
	let CanListClassifieds : Bool
	let CanRelist : Bool
	let DefaultDuration : UInt
	let AllowedDurations : [UInt]
	let Fees : FeesJSON
	let FreePhotoCount : UInt
	let MaximumPhotoCount : UInt
	let Charities : [CharityJSON]
	let Promotions : [PromoJSON]
	// Because I do not know the data type, this will always be set to empty upon
	// construction.
	let EmbeddedContentOptions : [Any]
	let MaximumTitleLength : UInt
	let AreaOfBusiness : Int
	let DefaultRelistDuration : UInt
	let CanHaveSecondCategory : Bool
	let CanBeSecondCategory : Bool
	let CanUseCounterOffers : Bool
	
	private enum CodingKeys : String, CodingKey {
		case CategoryId,
		Name,
		Path,
		CanListAuctions,
		CanListClassifieds,
		CanRelist,
		DefaultDuration,
		AllowedDurations,
		Fees,
		FreePhotoCount,
		MaximumPhotoCount,
		Charities,
		Promotions,
		//EmbeddedContentOptions,
		MaximumTitleLength,
		AreaOfBusiness,
		DefaultRelistDuration,
		CanHaveSecondCategory,
		CanBeSecondCategory,
		CanUseCounterOffers
	}
	
	// This is required because I do not know the data type of EmbeddedContentOptions
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		CategoryId = try container.decode(Int.self, forKey: .CategoryId)
		Name = try container.decode(String.self, forKey: .Name)
		Path = try container.decode(String.self, forKey: .Path)
		CanListAuctions = try container.decode(Bool.self, forKey: .CanListAuctions)
		CanListClassifieds = try container.decode(Bool.self, forKey: .CanListClassifieds)
		CanRelist = try container.decode(Bool.self, forKey: .CanRelist)
		DefaultDuration = try container.decode(UInt.self, forKey: .DefaultDuration)
		AllowedDurations = try container.decode([UInt].self, forKey: .AllowedDurations)
		Fees = try container.decode(FeesJSON.self, forKey: .Fees)
		FreePhotoCount = try container.decode(UInt.self, forKey: .FreePhotoCount)
		MaximumPhotoCount = try container.decode(UInt.self, forKey: .MaximumPhotoCount)
		Charities = try container.decode([CharityJSON].self, forKey: .Charities)
		Promotions = try container.decode([PromoJSON].self, forKey: .Promotions)
		// Always empty
		EmbeddedContentOptions = []
		MaximumTitleLength = try container.decode(UInt.self, forKey: .MaximumTitleLength)
		AreaOfBusiness = try container.decode(Int.self, forKey: .AreaOfBusiness)
		DefaultRelistDuration = try container.decode(UInt.self, forKey: .DefaultRelistDuration)
		CanHaveSecondCategory = try container.decode(Bool.self, forKey: .CanHaveSecondCategory)
		CanBeSecondCategory = try container.decode(Bool.self, forKey: .CanBeSecondCategory)
		CanUseCounterOffers = try container.decode(Bool.self, forKey: .CanUseCounterOffers)
	}
}
