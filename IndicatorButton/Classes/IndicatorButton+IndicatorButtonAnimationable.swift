//
//  IndicatorButton+IndicatorButtonAnimationable.swift
//  IndicatorButton
//
//  Created by gwangyonglee on 2020/02/29.
//

extension IndicatorButton: IndicatorButtonAnimationable {
	func shake() {
		let shake = CABasicAnimation(keyPath: "position")
		shake.duration = 0.1
		shake.repeatCount = 1
		shake.autoreverses = true
		shake.fromValue = CGPoint(x: center.x - 8, y: center.y)
		shake.toValue = CGPoint(x: center.x + 8, y: center.y)
		layer.add(shake, forKey: "position")
	}
	
	func flash() {
		let flash = CABasicAnimation(keyPath: "opacity")
		flash.duration = 0.25
		flash.fromValue = 1
		flash.toValue = 0.1
		flash.autoreverses = true
		flash.repeatCount = 1
		layer.add(flash, forKey: nil)
	}
	
	func pulse() {
		let pulse = CASpringAnimation(keyPath: "transform.scale")
		pulse.duration = 0.25
		pulse.fromValue = 0.9
		pulse.toValue = 1.0
		pulse.autoreverses = true
		pulse.repeatCount = 1
		pulse.initialVelocity = 0.5
		pulse.damping = 1.0
		
		layer.add(pulse, forKey: "pulse")
	}
}
