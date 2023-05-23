//
//  LocalizationStringKey+Extension.swift
//  YandexMap
//
//  Created by Oksana on 23.05.2023.
//

import SwiftUI

extension LocalizedStringKey {
    public func toString() -> String {
            //use reflection
            let mirror = Mirror(reflecting: self)
            
            //try to find 'key' attribute value
            let attributeLabelAndValue = mirror.children.first { (arg0) -> Bool in
                let (label, _) = arg0
                if(label == "key"){
                    return true;
                }
                return false;
            }
            
            if(attributeLabelAndValue != nil) {
                //ask for localization of found key via NSLocalizedString
                return String.localizedStringWithFormat(NSLocalizedString(attributeLabelAndValue!.value as! String, comment: ""));
            }
            else {
                return "Swift LocalizedStringKey signature must have changed. @see Apple documentation."
            }
        }
}
