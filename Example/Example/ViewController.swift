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
        Vrtx.shared.initialize(environment: .staging,
                               clientID: "ANBSARI_sandbox_sdk",
                               clientSecret: "ybjHK4Xqk88ZFrWatolxygUgCoz7aRSe",
                               theme: VrtxTheme(
                                primaryColor: .black,
                                backgroundColor: .white,
                                secondaryBackgroundColor: .hex("#F2F2F7"),
                                textColor: .black,
                                fieldBackground: .systemGray6,
                                secondaryTextColor: .hex("#3C3C43").withAlphaComponent(0.6),
                                secondaryButtonColor: .systemGray5
                               ),
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

