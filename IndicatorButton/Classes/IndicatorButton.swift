//
//  IndicatorButton.swift
//  IndicatorButton
//
//  Created by gwangyonglee on 2020/02/29.
//

import UIKit

public final class IndicatorButton: UIButton {

	override public var isSelected: Bool {
		willSet {
			UIView.transition(with: self, duration: 0.25, options: .curveEaseOut, animations: {
				newValue ? self.updateSelectedButtonColor() : self.updateNormalButtonColor()
			})
			updateIndicatorViewColor(newValue)
		}
	}
	
	/* UIActivityIndicatorView */
	public var indicatorView = UIActivityIndicatorView()
	
	/* Button Animation Type */
	public var type: IndicatorButtonType = .normal
	
	/* Button Title Color */
	public var titleColor: UIColor = .black {
		didSet {
			setTitleColor(titleColor, for: .normal)
		}
	}
	/* Button Selected Title Color */
	public var selectedTitleColor: UIColor = .white {
		didSet {
			setTitleColor(selectedTitleColor, for: .selected)
		}
	}
	
	/* CALayer BackgroundColor */
	public var bgColor: UIColor = .white {
		didSet {
			layer.backgroundColor = bgColor.cgColor
		}
	}
	/* CALayer Selected BackgroundColor */
	public var selectedBgColor: UIColor = .black
	
	
	/* CALayer BorderColor */
	public var borderColor: UIColor = .clear {
		didSet {
			layer.borderColor = borderColor.cgColor
		}
	}
	
	/* CALayer Selected BorderColor */
	public var selectedBorderColor: UIColor = .clear
	
	/* CALayer BorderWidth */
	public var borderWidth: CGFloat = 1.0 {
		didSet {
			layer.borderWidth = borderWidth
		}
	}
	
	/* CALayer CornerRadius */
	public var cornerRadius: CGFloat = 8.0 {
		didSet {
			layer.cornerRadius = cornerRadius
		}
	}
	
	/* CALayer Shadow Setup */
	public var withShadow: Bool = true {
		willSet {
			updateShadow(newValue)
		}
	}
	
	/* CALayer Shadow Color */
	public var shadowColor: UIColor = .black {
		didSet {
			updateShadow(true)
		}
	}
	
	/* UIActivityIndicatorView Color */
	public var indicatorColor: UIColor = .gray {
		didSet {
			indicatorView.color = indicatorColor
		}
	}
	/* UIActivityIndicatorView Selected Color */
	public var selectedIndicatorColor: UIColor = .gray
	
	// MARK: - Life Cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public init(frame: CGRect = .zero,
                text: String? = nil,
                font: UIFont? = nil,
                titleColor: UIColor = .black,
                selectedTitleColor: UIColor = .white,
                borderWidth: CGFloat = 1.0,
                cornerRadius: CGFloat = 8.0,
                bgColor: UIColor = .white,
                borderColor: UIColor = .clear,
                shadowColor: UIColor = .black,
                indicatorColor: UIColor = .gray) {
        super.init(frame: frame)
        
        // button set up
        tintColor = .clear
        
        if let text = text {
            setTitle(text, for: .normal)
        }
        titleLabel?.font = font
        setTitleColor(titleColor, for: .normal)
        setTitleColor(selectedTitleColor, for: .selected)
        
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.backgroundColor = bgColor.cgColor
        layer.borderColor = borderColor.cgColor
        
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 6)
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.5
        
        // activityindicator set up
        indicatorView.color = indicatorColor
        indicatorView.hidesWhenStopped = true
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
	override public func awakeFromNib() {
		super.awakeFromNib()
		initIndicatorButton()
	}
	
	override public func layoutSubviews() {
		super.layoutSubviews()
		indicatorView.center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
	}
	
	// MARK: - Methods
	private func initIndicatorButton() {
		// button set up
		tintColor = .clear
		
		setTitleColor(titleColor, for: .normal)
		setTitleColor(selectedTitleColor, for: .selected)
		setTitleColor(.yellow, for: .application)
		
		layer.borderWidth = borderWidth
		layer.cornerRadius = cornerRadius
		layer.backgroundColor = bgColor.cgColor
		layer.borderColor = borderColor.cgColor
		
		layer.shadowColor = shadowColor.cgColor
		layer.shadowOffset = CGSize(width: 0, height: 6)
		layer.shadowRadius = 8
		layer.shadowOpacity = 0.5
		
		// activityindicator set up
		indicatorView.color = indicatorColor
		indicatorView.hidesWhenStopped = true
	}
	
	public func startAnimating(_ completion: (()-> Void)? = nil) {
		isUserInteractionEnabled = false
		DispatchQueue.main.async {
			self.layoutIfNeeded()
			UIView.transition(with: self, duration: 0.25, options: .curveEaseOut, animations: {
				self.titleLabel?.alpha = 0.0
			}) { _ in
				self.addSubview(self.indicatorView)
				self.indicatorView.startAnimating()
				completion?()
			}
		}
	}
	
	public func stopAnimating(_ completion: (()-> Void)? = nil) {
		isUserInteractionEnabled = true
		titleLabel?.alpha = 1.0
		indicatorView.stopAnimating()
		indicatorView.removeFromSuperview()
		startAnimation()
		completion?()
	}

	// MARK: - Private Method
	private func updateNormalButtonColor() {
		layer.backgroundColor = bgColor.cgColor
		layer.borderColor = borderColor.cgColor
	}
	
	private func updateSelectedButtonColor() {
		layer.backgroundColor = selectedBgColor.cgColor
		layer.borderColor = selectedBorderColor.cgColor
	}
	
	private func updateShadow(_ isShadow: Bool) {
		layer.shadowColor = isShadow ? shadowColor.cgColor : UIColor.clear.cgColor
		layer.shadowOffset = isShadow ? CGSize(width: 0, height: 6) : .zero
		layer.shadowRadius = isShadow ? 8 : 0
		layer.shadowOpacity = isShadow ? 0.5 : 0
	}
	
	private func updateIndicatorViewColor(_ isSelected: Bool) {
		indicatorView.color = isSelected ? selectedIndicatorColor : indicatorColor
	}
	
	private func startAnimation() {
		switch type {
		case .normal:
			break
		case .shake:
			shake()
		case .flash:
			flash()
		case .pulse:
			pulse()
		}
	}
}
