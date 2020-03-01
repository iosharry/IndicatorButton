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

	@IBOutlet weak var normalButton: IndicatorButton!
	@IBOutlet weak var shakeButton: IndicatorButton!
	@IBOutlet weak var flashButton: IndicatorButton!
	@IBOutlet weak var pulseButton: IndicatorButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		initShakeButton()
		initFlashButton()
		initPulseButton()
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

	@IBAction func touchUpInsideButton(_ sender: IndicatorButton) {
		sender.startAnimating {
			DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
				sender.stopAnimating {
					sender.isSelected = !sender.isSelected
				}
			}
		}
	}
}

