//
//  SwiftUIView.swift
//  VoiceAppSwiftUI
//
//  Created by Chris Maley on 2019-10-04.
//  Copyright © 2019 Chris Maley. All rights reserved.
//

import SwiftUI

struct SwiftUIView: View {
    
    
    var body: some View {
        
  // ViewControllerWrapper()
        return Text(" ")
    
    }
    
}

struct ViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewControllerWrapper.UIViewControllerType {
        ViewController().view.isHidden = true
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        
       
        //
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
