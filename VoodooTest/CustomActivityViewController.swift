//
//  ActivityViewController.swift
//  VoodooTest
//
//  Created by Mathias Erligmann on 18/03/2022.
//

import UIKit

public class CustomActivityViewController: UIActivityViewController {

    private let controller: UIViewController!
    
    private let onDismiss: (() -> Void)?

    required public init(controller: UIViewController, onDismiss: (() -> Void)? = nil) {
        self.controller = controller
        self.onDismiss = onDismiss
        super.init(activityItems: [], applicationActivities: nil)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        let subViews = self.view.subviews
        for view in subViews {
            view.removeFromSuperview()
        }

        self.addChild(controller)
        self.view.addSubview(controller.view)
    }
    
    deinit {
        onDismiss?()
    }
}
