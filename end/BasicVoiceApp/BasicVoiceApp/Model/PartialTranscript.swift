//
//  partialTranscript.swift
//  ClientSDKTestApp
//
//  Created by Chris Maley on 2020-01-19.
//  Copyright © 2020 Chris Maley. All rights reserved.
//

import Foundation

struct PartialTranscript: Identifiable, Decodable {
    let id = UUID()
    let partialTranscription: String
}
