//
//  ViewController.swift
//  IndicatorButton
//
//  Created by gwangyonglee on 02/29/2020.
//  Copyright (c) 2020 gwangyonglee. All rights reserved.
//

import UIKit
import IndicatorButton

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var stackView: UIStackView!
	@IBOutlet weak var normalButton: IndicatorButton!
	@IBOutlet weak var shakeButton: IndicatorButton!
	@IBOutlet weak var flashButton: IndicatorButton!
	@IBOutlet weak var pulseButton: IndicatorButton!
	
    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
		initShakeButton()
		initFlashButton()
		initPulseButton()
        initProgrammaticallyButton()
    }

	private func initShakeButton() {
		shakeButton.type = .shake
	}
	
	private func initFlashButton() {
		flashButton.type = .flash
	}
	
	private func initPulseButton() {
		pulseButton.type = .pulse
	}
    
    private func initProgrammaticallyButton() {
        let indicatorButton = IndicatorButton(frame: CGRect(x: 0, y: 0, width: 125, height: 36), text: "button")
        indicatorButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        stackView.addArrangedSubview(indicatorButton)
    }

	@IBAction func touchUpInsideButton(_ sender: IndicatorButton) {
		sender.startAnimating {
			DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
				sender.stopAnimating {
					sender.isSelected = !sender.isSelected
				}
			}
		}
	}
    
    @objc func buttonClicked(_ sender: IndicatorButton) {
        sender.startAnimating {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                sender.stopAnimating {
                    sender.isSelected = !sender.isSelected
                }
            }
        }
    }
}

