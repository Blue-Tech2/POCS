//
//  DrawView.swift
//  POC_Read2
//
//  Created by Felipe Izepe on 24/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import UIKit

class DrawView: UIView {
	
	
		var objs:[Dwg_Object] = [Dwg_Object]()
	
	
	override func draw(_ rect: CGRect) {
		let context = UIGraphicsGetCurrentContext()!
		
		for index in 0..<objs.count {
			context.saveGState()
			self.drawObject(index: index, context: context)
			context.restoreGState()
		}
		
	}
	
	internal func drawObject(index: Int, context ctx: CGContext) {
		ctx.setFillColor(UIColor.black.cgColor)
		ctx.setStrokeColor(UIColor.black.cgColor)
		
		let manager = PWDManager.shared
		switch(objs[index].fixedtype.rawValue) {
		case 17: //ARC
			if let arc = manager.getARC(index: index) {
				let center = CGPoint(x: arc.center.x, y: arc.center.y)
				ctx.setLineWidth(CGFloat(arc.thickness + 1))
				ctx.addArc(center: center, radius: CGFloat(arc.radius + 1), startAngle: CGFloat(arc.start_angle), endAngle: CGFloat(arc.end_angle), clockwise: true)
				ctx.drawPath(using: .fillStroke)
			}
			break
		case 18://Circle
			if let circ = manager.getCircle(index: index) {
				let center = CGPoint(x: circ.center.x - circ.radius/2, y: circ.center.y - circ.radius/2)
				ctx.setLineWidth(CGFloat(circ.thickness + 1))
				let size = CGSize(width: 2 * circ.radius, height: 2 * circ.radius)
				let rect = CGRect(origin: center, size: size)
				ctx.addEllipse(in: rect)
				ctx.drawPath(using: .fillStroke)
			}
			break
		case 19://Line
			if let line = manager.getLine(index: index) {
				let start = CGPoint(x: line.start.x, y: line.start.y)
				let end = CGPoint(x: line.end.x, y: line.end.y)
				ctx.setLineWidth(CGFloat(line.thickness + 1))
				ctx.addLines(between: [start,end])
				ctx.drawPath(using: .fillStroke)
			}
			break
			
		case 1:
			if let text = manager.getText(index: index){
				ctx.setLineWidth(CGFloat(text.thickness + 1))
				
				let center = CGPoint(x: text.alignment_pt.x, y: text.alignment_pt.y)
				let renderer = UIGraphicsImageRenderer(size: CGSize(width: self.frame.width, height: self.frame.height))
				let img = renderer.image { ctx in
					let paragraphStyle = NSMutableParagraphStyle()
					paragraphStyle.alignment = .center
					
					let attrs = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Thin", size: 18)!, NSAttributedString.Key.paragraphStyle: paragraphStyle]
					
					let string = String(cString: text.text_value)
					string.draw(with: CGRect(x: Double(center.x), y: Double(center.y), width: (Double(string.count) * text.width_factor), height: text.height + 10), options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
				}
			
				let imgView = UIImageView(image: img)
				self.addSubview(imgView)
				
			}
			break
		default:
			return
		}
	}
	
}
