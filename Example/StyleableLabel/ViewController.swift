//
//  ViewController.swift
//  StyleableLabel
//
//  Created by mrasterisco on 04/29/2020.
//  Copyright (c) 2020 mrasterisco. All rights reserved.
//

import UIKit
import StyleableLabel
import Combine

class ViewController: UITableViewController {
    
    @IBOutlet weak var label: StyleableLabel!
    
    @IBOutlet weak var cornerRadiusField: UITextField!
    @IBOutlet weak var topInsetField: UITextField!
    @IBOutlet weak var leadingInsetField: UITextField!
    @IBOutlet weak var bottomInsetField: UITextField!
    @IBOutlet weak var trailingInsetField: UITextField!
    @IBOutlet weak var contentField: UITextField!

    private var cancellables = [AnyCancellable]()
    
    lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cancellables = [
            self.publisher(for: self.cornerRadiusField)
                .sink(receiveValue: { [unowned self] value in
                    self.label.cornerRadius = value
                }),
            
            Publishers.CombineLatest4(
                self.publisher(for: self.topInsetField),
                self.publisher(for: self.leadingInsetField),
                self.publisher(for: self.bottomInsetField),
                self.publisher(for: self.trailingInsetField)
            )
                .sink(receiveValue: { [unowned self] insets in
                    self.label.directionalEdgeInsets = NSDirectionalEdgeInsets(top: insets.0, leading: insets.1, bottom: insets.2, trailing: insets.3)
                }),
            
            self.textPublisher(for: self.contentField)
                .sink(receiveValue: { [unowned self] text in
                    self.label.text = text
                })
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let headerView = self.tableView.tableHeaderView else { return }
        
        let size = headerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            tableView.tableHeaderView = headerView
            tableView.layoutIfNeeded()
        }
    }
    
    private func textPublisher(for textField: UITextField) -> AnyPublisher<String, NotificationCenter.Publisher.Failure> {
        return NotificationCenter.default.publisher(for: .UITextFieldTextDidChange, object: textField)
            .map { _ in textField.text ?? "" }
            .prepend(textField.text ?? "").eraseToAnyPublisher()
    }
    
    private func publisher(for textField: UITextField) -> AnyPublisher<CGFloat, NotificationCenter.Publisher.Failure> {
        self.textPublisher(for: textField)
            .map { [unowned self] text -> CGFloat in
                CGFloat(self.numberFormatter.number(from: text)?.floatValue ?? 0)
            }.eraseToAnyPublisher()
    }

}

