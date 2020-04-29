//
//  StyleableLabel.swift
//
//  Created by Alessio Moiso on 29/04/2020.
//

import UIKit

/// A UILabel subclass that supports adding directional content insets
/// and exposes access to the CALayer `cornerRadius` property
/// directly.
@IBDesignable public class StyleableLabel: UILabel {
    
    /// Get or set the view corner radius.
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    private var insets: Any? = nil {
        didSet {
            self.setNeedsDisplay()
            self.invalidateIntrinsicContentSize()
        }
    }
    
    /// Get or set the directional edge insets of this view.
    @available(iOS 11.0, *)
    public var directionalEdgeInsets: NSDirectionalEdgeInsets? {
        get {
            if let directionalEdgeInsets = self.insets as? NSDirectionalEdgeInsets {
                return directionalEdgeInsets
            } else if let edgeInsets = self.insets as? UIEdgeInsets {
                return edgeInsets.toDirectional(self.effectiveUserInterfaceLayoutDirection)
            }
            return nil
        }
        set {
            self.insets = newValue
        }
    }
    
    /// Get or set the edge insets of this view.
    public var edgeInsets: UIEdgeInsets? {
        get {
            if #available(iOS 11.0, *), let directionalEdgeInsets = self.insets as? NSDirectionalEdgeInsets {
                return directionalEdgeInsets.toFixed(self.effectiveUserInterfaceLayoutDirection)
            } else if let edgeInsets = self.insets as? UIEdgeInsets {
                return edgeInsets
            }
            return nil
        }
        set {
            self.insets = newValue
        }
    }
    
    /// Frame initializer.
    ///
    /// - Parameter frame: A frame.
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    /// Coder initializer.
    ///
    /// - Parameter aDecoder: A decoder.
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    /// Setup the view.
    private func setup() {
        self.clipsToBounds = true
    }
    
    /// Draw text considering the content insets.
    ///
    /// - parameters:
    ///     - rect: A rect.
    override public func drawText(in rect: CGRect) {
        var insets = UIEdgeInsets.zero
        if #available(iOS 11.0, *), let directionalEdgeInsets =  self.directionalEdgeInsets?.toFixed(self.effectiveUserInterfaceLayoutDirection) {
            insets = directionalEdgeInsets
        } else if let fixedEdgeInsets = self.edgeInsets {
            insets = fixedEdgeInsets
        }

        super.drawText(in: rect.inset(by: insets))
    }
    
    /// Get the bounding rect of the text considering insets.
    ///
    /// Heavily inspired by https://stackoverflow.com/a/21267507
    public override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let textInsets = self.edgeInsets ?? .zero
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    
}

