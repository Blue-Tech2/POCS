//
//  EditView
//  PDF_Draw_Poc
//
//  Created by Felipe Izepe on 26/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import PDFKit
import UIKit

enum ColorType{
	case red
	case blue
	case green
}

class EditView: UIView {
	
	/// Class param
	var path:UIBezierPath?
	var initialLocation = CGPoint.zero
	var finalLocation = CGPoint.zero
	var shapeLayer: CAShapeLayer!
	
	
	var bluePath: UIBezierPath!
	var redPath: UIBezierPath!
	var greenPath: UIBezierPath!
	var redLayer = CAShapeLayer()
	var blueLayer = CAShapeLayer()
	var greenLayer = CAShapeLayer()
	
	var drawnPath: UIBezierPath!
	
	var image: UIImage?
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func loadView() {
		self.layer.addSublayer(blueLayer)
		self.layer.addSublayer(redLayer)
		self.layer.addSublayer(greenLayer)
		self.blueLayer.strokeColor = UIColor.blue.cgColor
		self.redLayer.strokeColor = UIColor.red.cgColor
		self.greenLayer.strokeColor = UIColor.green.cgColor
		
		self.blueLayer.opacity = 0.5
		self.blueLayer.lineWidth = 8
		
		self.redLayer.opacity = 0.5
		self.redLayer.lineWidth = 8
		
		self.greenLayer.opacity = 0.5
		self.greenLayer.lineWidth = 8
		
		self.bluePath = UIBezierPath()
		self.redPath = UIBezierPath()
		self.greenPath = UIBezierPath()
		
		self.shapeLayer = blueLayer
		self.drawnPath = bluePath
		
		
	}
	
	// MARK: Lines Touches methods
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first!
		let location = touch.location(in: self)

		self.path = UIBezierPath()
		initialLocation = location
		
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let path = self.path else { return }
		
		let touch = touches.first!
		let location = touch.location(in: self)
		
		finalLocation = CGPoint(x: location.x, y: location.y)
		
		path.removeAllPoints()
		path.move(to: initialLocation)
		path.addLine(to: finalLocation)

		shapeLayer.path = path.cgPath
		
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		guard let path = self.path else { return }
		
		let touch = touches.first!
		let location = touch.location(in: self)
		
		finalLocation = CGPoint(x: location.x, y: location.y)
		
		path.removeAllPoints()
		path.move(to: initialLocation)
		path.addLine(to: finalLocation)
					
		drawnPath.append(path)

		shapeLayer.path = drawnPath.cgPath
		self.path = nil
		
	}
	
	func changeTrailColor(code: ColorType) {
		
		switch code {
		case .red:
			self.shapeLayer = redLayer
			self.drawnPath = redPath
		case .green:
			self.shapeLayer = greenLayer
			self.drawnPath = greenPath
		case .blue:
			self.shapeLayer = blueLayer
			self.drawnPath = bluePath
		}
	}
	
}
