import Foundation

// Option to change API URL though it is limited because this app has a hard-coded JSON struct layout.
var passedURL : String? = nil
if CommandLine.argc > 2 {
	if CommandLine.arguments[1] == "-u" {
		passedURL = CommandLine.arguments[2]
	}
	else {
		print("Invalid argument")
		exit(1)
	}
}

// So the command doesn't exit before the server response is received.
let sema = DispatchSemaphore(value: 0)

var url: URL! = nil
if let passedURL = passedURL {
	url = URL(string: passedURL)
}
if url == nil {
	url = URL(string: "https://api.tmsandbox.co.nz/v1/Categories/6328/Details.json?catalogue=false")!
}

QueryServerAPIAsync(url: url, done: { data, resp, err in
	if err != nil {
		print(err!.localizedDescription)
		exit(1)
	}
	if resp == nil {
		print("No response from server")
		exit(1)
	}

	guard let data = data else {
		print("No data from server")
		exit(1)
	}
	
	do {
		let reply = try CreateReplyJSON(data: data)
		if try APICheck(reply: reply) { print("pass"); exit(0) }
		else { print("fail"); exit(-1) }
	}
	catch let E {
		print(E.localizedDescription)
		exit(1)
	}
	sema.signal()
})

sema.wait()

/*
 swiftc -o api main.swift CharityJSON.swift PromotionsJSON.swift ReplyJSON.swift FeesJSON.swift SuccessTiersJSON.swift ConstructReply.swift QueryServer.swift ApiCheck.swift
*/
