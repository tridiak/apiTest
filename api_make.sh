#!/bin/zsh

swiftc -O -o api main.swift CharityJSON.swift PromotionsJSON.swift ReplyJSON.swift FeesJSON.swift SuccessTiersJSON.swift ConstructReply.swift QueryServer.swift ApiCheck.swift

