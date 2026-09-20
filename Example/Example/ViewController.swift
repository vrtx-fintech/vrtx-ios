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

    private func makeExampleTheme() -> ThemeOptions {
        let theme = ThemeOptions()

        theme.primaryColor = "#0A5CFF"
        theme.buttonTextColor = "#FFFFFF"
        theme.backgroundColor = "#F7F9FC"
        theme.secondaryBackgroundColor = "#FFFFFF"
        theme.textColor = "#101828"
        theme.secondaryTextColor = "#475467"
        theme.tertiaryTextColor = "#667085"
        theme.quaternaryTextColor = "#98A2B3"
        theme.fieldBackground = "#FFFFFF"
        theme.textFieldBackgroundColor = "#FFFFFF"
        theme.textFieldOutlineColor = "#D0D5DD"
        theme.secondaryButtonColor = "#EAF1FF"
        theme.creditArrowColor = "#12B76A"
        theme.creditBackgroundColor = "#ECFDF3"
        theme.errorColor = "#D92D20"
        theme.errorBackgroundColor = "rgba(217,45,32,0.10)"
        theme.cardGradientStart = "#0A5CFF"
        theme.cardGradientEnd = "#0044CC"

        theme.fontFamilyEnglish = "Arial"
        theme.fontFamilyArabic = "Arial"
        theme.bodyFontSize = 16
        theme.textSizes = [
            "l": 32,
            "t_1": 28,
            "t_2": 22,
            "t_3": 20,
            "h": 17,
            "body": 16,
            "cta": 15,
            "subheading": 14,
            "footnote": 13,
            "cap_1": 12,
            "cap_2": 11,
        ]

        theme.cardCornerRadius = 16
        theme.buttonCornerRadius = 24
        theme.spacing = ["xs": 4, "sm": 8, "md": 16, "lg": 24, "xl": 32]
        theme.sizing = ["buttonHeight": 56, "fieldHeight": 56, "cardHeight": 220]
        theme.layout = .optionC
        theme.cardImage = .image(UIImage(systemName: "creditcard.fill")!)
        theme.brandLogo = .image(UIImage(systemName: "v.circle.fill")!)

        return theme
    }
    
    @IBAction func btnGetStartedTapped(_ sender: Any) {
        let clientID = Bundle.main.object(forInfoDictionaryKey: "VrtxClientID") as? String ?? ""
        let clientSecret = Bundle.main.object(forInfoDictionaryKey: "VrtxClientSecret") as? String ?? ""
        let externalReference = "ios-example-\(UUID().uuidString)"

        Vrtx.setup(
            environment: .sandbox,
            clientID: clientID,
            clientSecret: clientSecret,
            mode: .light,
            language: .english,
            externalReference: externalReference,
            fontFamily: "Inter",
            theme: makeExampleTheme(),
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
            },
            onExit: {
                // SDK UI dismissed
            }
        )
    }
}
