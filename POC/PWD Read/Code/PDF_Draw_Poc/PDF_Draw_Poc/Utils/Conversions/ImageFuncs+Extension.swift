//
//  ImageConversions.swift
//  PDF_Draw_Poc
//
//  Created by Felipe Izepe on 26/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import PDFKit
import UIKit

class ImageConversions {
	
	static func drawPDFfromURL(path: URL, box: CGRect) -> UIImage? {
		guard let cgDocument = CGPDFDocument( path as CFURL) else{return nil}
		
		guard let page = cgDocument.page(at: 1) else { return nil }

		let renderer = UIGraphicsImageRenderer(size: box.size)
		let img = renderer.image { ctx in
			UIColor.white.set()
			ctx.fill(box)
			ctx.cgContext.translateBy(x: 0.0, y: box.size.height)
			ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
			
			
			ctx.cgContext.drawPDFPage(page)
		}
		
		return img
	}
}


extension UIImage {
	func getPixelColor(pos: CGPoint) -> UIColor? {
		
		guard let image = self.cgImage else {return nil}
		guard let provider = image.dataProvider else {return nil}
		
		let pixelData = provider.data
		let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
		
		let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
		
		let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
		let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
		let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
		let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
		
		return UIColor(red: r, green: g, blue: b, alpha: a)
	}
	
}

extension UIView {
	
	// Using a function since `var image` might conflict with an existing variable
	// (like on `UIImageView`)
	func asImage(size: CGRect) -> UIImage {
		let renderer = UIGraphicsImageRenderer(bounds: size)
		return renderer.image { rendererContext in
			layer.render(in: rendererContext.cgContext)
		}
	}
}


extension UIColor {
	func isBlack() -> Bool {
		var white: CGFloat = 0
		getWhite(&white, alpha: nil)
		return white <= 0.3
	}
}
