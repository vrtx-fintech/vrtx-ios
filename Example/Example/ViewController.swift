//
//  ViewController.swift
//  Example
//
//  Created by Abdul Jabbar on 30/04/2026.
//

import UIKit
import VRTX

class ViewController: UIViewController {
    
    // MARK: - UIView Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - UIButton Actions
    @IBAction func btnGetStartedTapped(_ sender: Any) {
        /// Vrtx initialization
        Vrtx.setup(environment: .sandbox,
                   clientID: "YOUR_CLIENT_ID",
                   clientSecret: "YOUR_CLIENT_SECRET",
                   mode: .light,
                   language: .english,
                   from: self,
                   completion: { error, started in
            guard started else {
                return
            }
            
            /// error state
            if !error.isEmpty {
                VrtxAlert.present(
                    from: self,
                    config: .init(
                        message: error,
                        primaryAction: .init(
                            title: "OK",
                            style: .primary
                        ) {}
                    )
                )
            }
        })
    }
}

