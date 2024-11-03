//
//  RoommateNavigationViewModel.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/3/24.
//

import Foundation
import MessageUI
import SwiftUI

struct MessageView: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentation
    var recipients: [String]
    var body: String
    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        var parent: MessageView
        
        init(parent: MessageView) {
            self.parent = parent
        }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            parent.presentation.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> MFMessageComposeViewController {
        let messageVC = MFMessageComposeViewController()
        messageVC.messageComposeDelegate = context.coordinator
        messageVC.recipients = recipients
        messageVC.body = body
        return messageVC
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: Context) {}
}

