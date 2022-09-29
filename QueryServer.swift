//
//  QueryServer.swift
//  replyParse
//
//  Created by tridiak on 28/09/22.
//

import Foundation

typealias QueryDone = (_ data: Data?, _ resp: URLResponse?, _ err: Error?) -> Void

/// Query server API and execute the callback when done.
func QueryServerAPIAsync(url: URL, done: @escaping QueryDone)  {
	let task = URLSession.shared.dataTask(with: url) { DATA, RESP, ERR in
		done(DATA, RESP, ERR)
	}
	task.resume()
}
