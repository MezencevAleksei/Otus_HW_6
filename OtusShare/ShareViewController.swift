//
//  ShareViewController.swift
//  OtusShare
//
//  Created by alex on 17/07/2019.
//  Copyright © 2019 Mezencev Aleksei. All rights reserved.
//

import UIKit
import Social

class ShareViewController: SLComposeServiceViewController {

    override func isContentValid() -> Bool {
        // Do validation of contentText and/or NSExtensionContext attachments here
        return true
    }

    override func didSelectPost() {
        
        //guard let url = URL(string: "Otus_HW_6://text") else { return }
//        guard let url = URL(string: "Otus_HW_6") else { return }
//
//        NSLog("my log Пришли в расширение")
//        NSLog("my log \(url)")
//        extensionContext?.open(url, completionHandler: nil)
//        self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
        
        
        guard let text = textView.text else {return}
        
        for item: Any in extensionContext!.inputItems {
            if let inputItem = item as? NSExtensionItem {
                for _: Any in inputItem.attachments! {
                    if let ud = UserDefaults(suiteName: "group.OtusHW.OtusShare") {
                        ud.set(text, forKey: "text")
                    }
                }
            }
        }
        let _url = URL(string: "OtusHW://text")
        if let url = _url {
            _ = openURL(url)
            //extensionContext?.open(url, completionHandler: nil)
        }
        dismiss(animated: false) {
            self.extensionContext!.completeRequest(returningItems: [], completionHandler: nil)
        }
        
    }

    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }

    @objc func openURL(_ url: URL) -> Bool {
        var responder: UIResponder? = self
        while responder != nil {
            if let app = responder as? UIApplication {
                //NSLog("my log Пытаемся открыть УРЛ")
                return app.perform(#selector(openURL(_:)), with: url) != nil
            }
            responder = responder?.next
        }
        return false
    }
    
    
}
