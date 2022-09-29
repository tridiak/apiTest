# API test tool

## Files
```
api_make.sh
```
Compiles the tool.<br>
macOS version 12.6, Build 21G115<br>
Swift version 5.7 (swiftlang-5.7.0.127.4 clang-1400.0.29.50)<br>
Architecture is intel 64bit. In theory it should compile on mac silicon, but I don't have one to test it with.<br>
```./api_make.sh``` to execute.<br>
The command line may complain about 'bad interpreter'. This means the zsh path is not at ```/bin/zsh``` and the first line will need to be changed. 

```
ApiCheck.swiftCharityJSON.swiftConstructReply.swiftFeesJSON.swiftmain.swiftPromotionsJSON.swiftQueryServer.swiftReplyJSON.swiftSuccessTiersJSON.swift
```
```ApiCheck.swift``` is the file that does the actual criteria check.<br>
```QueryServer.swift``` calls the server API.<br>
```ConstructReply.swift``` converts the JSON response from the server to swift structs.<br>

## Executable
To run enter ```./api``` in command line.
You can pass ```-u "server api URL"``` if you want to pass a different api url.

The tool is only designed for a specific JSON format return by
``` https://api.tmsandbox.co.nz/v1/Categories/6328/Details.json?catalogue=false ```

## Execution

The tool will return
- pass (0) for criteria success
- fail (-1) for criteria failure
- Error message (1) usually for JOSN parsing error or server access error

## Criteria Configuration
You can change the test criteria by editing the ```ApiCheck.swift``` file.
You need to know swift to do so.

## Future
Another tool that parses a simple semi-natural language criteria description and creates the ```ApiCheck.swift``` file.
