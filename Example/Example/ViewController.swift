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
        let clientID = Bundle.main.object(forInfoDictionaryKey: "VrtxClientID") as? String ?? ""
        let clientSecret = Bundle.main.object(forInfoDictionaryKey: "VrtxClientSecret") as? String ?? ""

        Vrtx.setup(environment: .sandbox,
                   clientID: clientID,
                   clientSecret: clientSecret,
                   mode: .light,
                   language: .english,
                   fontFamily: "Inter",
                   onSuccess: {
            // SDK UI launched
        },
                   onError: { [weak self] error in
            let alert = UIAlertController(
                title: "Error \(error.status)",
                message: error.message,
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true)
        })
    }
}

