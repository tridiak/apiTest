//
//  ConstructReply.swift
//
//  Created by tridiak on 28/09/22.
//

import Foundation

/// Decode server JSON response and return ReplyJSON struct.
/// Throws on any error.
func CreateReplyJSON(data: Data) throws -> ReplyJSON {
	let decoder = JSONDecoder()
	let reply = try decoder.decode(ReplyJSON.self, from: data)
	
	return reply
}
