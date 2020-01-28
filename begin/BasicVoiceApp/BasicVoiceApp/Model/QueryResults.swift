//
//  test.swift
//  VoiceAppSwiftUI
//
//  Created by Chris Maley on 2019-12-18.
//  Copyright © 2019 Chris Maley. All rights reserved.
//

import Foundation

struct QueryResult: Identifiable, Decodable {
    let id = UUID()
    let displayText: String
    let transcript: String
    let intent: String
    let richMessages: String
}
