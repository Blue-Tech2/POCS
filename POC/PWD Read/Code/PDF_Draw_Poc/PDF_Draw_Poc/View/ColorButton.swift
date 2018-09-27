//
//  ColorButton.swift
//  PDF_Draw_Poc
//
//  Created by Felipe Izepe on 27/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
open class CollorButton: UIButton {
	
	
	@IBInspectable
	public var cornerRadius: CGFloat = 2.0 {
		didSet {
			self.layer.cornerRadius = self.cornerRadius
		}
	}
	
	@IBInspectable
	public var bgColor: UIColor = UIColor.clear {
		didSet {
			self.layer.backgroundColor = bgColor.cgColor
		}
	}
	
	public override init(frame: CGRect) {
		super.init(frame: frame)

	}
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	
}
