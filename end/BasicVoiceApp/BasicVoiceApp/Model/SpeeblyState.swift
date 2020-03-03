//
//  microphoneState.swift
//  VoiceAppSwiftUI
//
//  Created by Chris Maley on 2019-12-18.
//  Copyright © 2019 Chris Maley. All rights reserved.
//

import Foundation

struct SpeeblyState: Identifiable, Decodable {
    let id = UUID()
    let displayText: String
    let image: String
    let state: String
    let isStarted: Bool
}
