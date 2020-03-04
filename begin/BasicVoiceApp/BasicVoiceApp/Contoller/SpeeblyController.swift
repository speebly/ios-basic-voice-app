import SwiftUI
import SpeeblyClientSDK


class SpeeblyController: ObservableObject, SpeeblyQueryDelegate  {
    
    @Published var microphoneState = MicrophoneState(displayText: "Tap to start", image: "Power", state: "start", isStarted: false)
    @Published var queryResult = QueryResult(displayText: "", transcript: " ", intent: " ", richMessages: " ")
    @Published var parialTranscript = PartialTranscript(partialTranscription: " ")
    @Published var isStarted: Bool = false
    @Published var isTranscriptFinal: Bool = false
    @Published var transcriptColor:Color = .white
    @Published var isVoice: Bool
    @Published var eventName: String
    var speebly:SpeeblyQuery
    
    init(isVoice: Bool, eventName:String) {
        self.isVoice = isVoice
        self.eventName = eventName
        self.speebly = SpeeblyQuery()
    }
    
    func startVoiceQueryWithSiri(event:String) {
        self.speebly.delegate = self
        self.isStarted = true
        // set mic to speeaking state
        self.microphoneState = MicrophoneState(displayText: "Tap tp start", image: "Notlistening",  state: "speaking", isStarted: self.isStarted)
        self.speebly.StartVoiceQuery(eventName: event)
    }
    
    func startVoiceQuery() {
        self.speebly.delegate = self
        self.isStarted = true
        // set mic to speeaking state
        self.microphoneState = MicrophoneState(displayText: "Tap tp start", image: "Notlistening",  state: "speaking", isStarted: self.isStarted)
        self.speebly.StartVoiceQuery()
    }
   
    //speebly delegate
    func didStateChange(state: String) {
        DispatchQueue.main.async {
            if state == "listening" {
                // self.microphoneState = MicrophoneState(displayText: "Listening", image: "Listening", state: "listening", isStarted: self.isStarted)
            }
            else if state == "notListening" {
                //self.microphoneState = MicrophoneState(displayText: "Speaking", image: "Notlistening", state: "speaking", isStarted: self.isStarted)
            }
            else if state == "redirect" {
                //self.microphoneState = MicrophoneState(displayText: "boardingpass", image: "boardingpass", state: "speaking", isStarted: self.isStarted)
            }
            else if state == "noNetwork" {
               // self.microphoneState = MicrophoneState(displayText: "No Wifi", image: "nowifi", state: state, isStarted: self.isStarted)
            }
            else if state == "timeOut" {
                self.microphoneState = MicrophoneState(displayText: "Tap to start", image: "Notlistening", state: state, isStarted: self.isStarted)
                self.isStarted = false
            }
            else if state == "close" {
                self.microphoneState = MicrophoneState(displayText: "Tap to start", image: "Power", state: state, isStarted: self.isStarted)
                self.isStarted = false
            }
            else if state == "connectionFailed" {
                self.microphoneState = MicrophoneState(displayText: "Error", image: "Error", state: state, isStarted: self.isStarted)
                self.isStarted = false
            }
        }
    }
    
    // speebly delagates
    func didReceiveQueryResult(speeblyQueryResult: SpeeblyQueryResponse) {
          
            DispatchQueue.main.async {
                self.transcriptColor = .gray
                
                self.parialTranscript =  PartialTranscript(partialTranscription: speeblyQueryResult.transcript)
               
                self.queryResult =  QueryResult(displayText: speeblyQueryResult.displayText, transcript: speeblyQueryResult.transcript, intent: " ", richMessages: "")
            }
    }
    
    // speebly delegates
    
    func didReceivePartialTranscription(partialTranscription: String) {
        if partialTranscription.count > 1 {
            DispatchQueue.main.async {
                self.transcriptColor =  Color.white
                 self.parialTranscript =  PartialTranscript(partialTranscription: partialTranscription)
            }
        }
    }
 
        
    func didReceiveError(error: SpeeblyQueryError) {
        print(error)
    }
}
