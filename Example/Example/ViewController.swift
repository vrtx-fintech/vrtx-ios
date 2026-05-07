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
        Vrtx.setup(environment: .staging,
                   clientID: "YOUR_CLIENT_ID",
                   clientSecret: "YOUR_CLIENT_SECRET",
                   mode: .light,
                   language: .english,
                   completion: {
            configured in
            guard configured else {
                return
            }
            
            Vrtx.launch(from: self, completion: {
                _, onError, _ in
                if !onError.isEmpty {
                    VrtxAlert.present(
                        from: self,
                        config: .init(
                            message: onError,
                            primaryAction: .init(
                                title: "OK",
                                style: .primary
                            ) {}
                        )
                    )
                }
            })
        })
    }
}

