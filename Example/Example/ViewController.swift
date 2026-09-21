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

        theme.cardImage = .remote(URL(string: "https://example.com/card.png")!)
        theme.brandLogo = .remote(URL(string: "https://example.com/logo.png")!)
        theme.brandName = "Atlas Pay"

        theme.colors = VrtxColors(
            allBrands: VrtxColors.AllBrands(
                primary: "#377DFF",
                buttonLabel: "#FFFFFF"
            ),
            labels: VrtxColors.Labels(
                primary: "#12233D",
                secondary: "#60708A",
                tertiary: "#8B9AB2",
                quaternary: "#B8C4D6"
            ),
            fills: VrtxColors.Fills(
                primary: "#EAF3FF",
                secondary: "#DCEAFF",
                tertiary: "#C5D9F5",
                quaternary: "#ADC8EC",
                vibrant: VrtxColors.Fills.Vibrant(secondary: "#4DE3D1")
            ),
            backgrounds: VrtxColors.Backgrounds(
                primary: "#F4F8FF",
                secondary: "#F7FAFF",
                tertiary: "#E7F5F6",
                primaryElevated: "#FFFFFF",
                secondaryElevated: "#F1F6FC",
                tertiaryElevated: "#E6EEF8"
            ),
            backgroundsGradient: VrtxColors.BackgroundsGradient(
                wb01: "#EAF3FF",
                wb02: "#E7F5F6"
            ),
            accents: VrtxColors.Accents(
                red: "#E05252",
                redBg: "#FFE7E7",
                green: "#2E9B67",
                greenBg: "#E1F5EA",
                orange: "#E58A2B",
                indigo: "#5B5BD6",
                teal: "#4DE3D1",
                pink: "#D65B9B",
                cyan: "#2DAAC7",
                purple: "#8A5BD6"
            )
        )

        theme.spacing = VrtxSpacing(
            x0: 0, xxs: 2, xs: 4, sm: 8, md: 12,
            ml: 16, lg: 20, xl: 24, xxl: 32, xxxl: 40
        )
        theme.radius = VrtxRadius(
            x0: 0, xxs: 2, xs: 4, s: 6, sm: 8,
            md: 12, ml: 16, lg: 20, xl: 24, xxl: 28,
            xxxl: 32, big: 40, full: 999, huge: 64
        )
        theme.sizing = VrtxSizing(
            xxs: 2, xs: 4, sm: 8, md: 16,
            lg: 24, xl: 32, xxl: 48, xxxl: 64
        )

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
            homeDesignOption: .optionC, // .optionA, .optionB, or .optionC
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
