//
//  InsetsConverter.swift
//  Pods-StyleableLabel_Example
//
//  Created by Alessio Moiso on 29/04/2020.
//

import UIKit

extension UIEdgeInsets {
    
    @available(iOS 11.0, *)
    func toDirectional(_ layoutDirection: UIUserInterfaceLayoutDirection) -> NSDirectionalEdgeInsets {
        switch layoutDirection {
        case .leftToRight:
            return NSDirectionalEdgeInsets(top: self.top, leading: self.left, bottom: self.bottom, trailing: self.right)
        default:
            return NSDirectionalEdgeInsets(top: self.top, leading: self.right, bottom: self.bottom, trailing: self.left)
        }
    }
    
}

@available(iOS 11.0, *)
extension NSDirectionalEdgeInsets {
    
    func toFixed(_ layoutDirection: UIUserInterfaceLayoutDirection) -> UIEdgeInsets {
        switch layoutDirection {
        case .leftToRight:
            return UIEdgeInsets(top: self.top, left: self.leading, bottom: self.bottom, right: self.trailing)
        default:
            return UIEdgeInsets(top: self.top, left: self.trailing, bottom: self.bottom, right: self.leading)
        }
    }
    
}
