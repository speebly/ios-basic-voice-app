import SwiftUI

struct ContentView : View {
    @ObservedObject var speebly = SpeeblyController()
    @State var isStarted:Bool = false
    @State var selectedView = 1
    @State private var show = false
    
    init() {}

    var body: some View {
        ZStack() {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                HStack() {
                    Text(self.speebly.parialTranscript.partialTranscription)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(self.speebly.transcriptColor)
                        .padding(.top,20)
                        .padding(.leading, 70)
                        .padding(.bottom, 20)
                    Spacer()
                }
                
                HStack() {
                    Text(self.speebly.queryResult.displayText)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(.leading, 20)
                    Spacer()
                }
                
                Spacer()
                if !self.speebly.isStarted {
                    Text(self.speebly.microphoneState.displayText)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding()
                  
                     Spacer()
                }
            }
        }.onTapGesture {
            if !self.speebly.isStarted {
                self.speebly.startVoiceQuery()
            }
        }
    }
}
