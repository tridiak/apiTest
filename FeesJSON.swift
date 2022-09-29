//
//  FeesJSON.swift
//
//  Created by tridiak on 28/09/22.
//

import Foundation

struct FeesJSON : Codable {
	let Bundle : Double?
	let EndDate : Double?
	let Feature : Double?
	let Gallery : Double?
	let Reserved : Double?
	let Subtitle : Double?
	let TenDays : Double?
	let Withdrawal : Double?
	let HighVolume : Double?
	let MaximumSuccessFee : Double?
	let SuccessFeeTiers : [SuccessTiersJSON]
	let SecondCategory : Double?
}
