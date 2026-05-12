//
//  ViewController.swift
//  Example
//
//  Created by Abdul Jabbar on 12/05/2026.
//

import UIKit
import VRTX

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnGetStartedTapped(_ sender: Any) {
        Vrtx.setup(environment: .sandbox,
                   clientID: "VRTX_CLIENT_ID",
                   clientSecret: "VRTX_CLIENT_SECRET",
                   mode: .light,
                   language: .english,
                   fontFamily: "Inter",
                   completion: { onError, started in
            guard started else {
                return
            }
            
            if !onError.isEmpty {
                /// error state
            }
        })
    }
}

