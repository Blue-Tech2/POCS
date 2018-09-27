//
//  blueprintBackView.swift
//  PDF_Draw_Poc
//
//  Created by Felipe Izepe on 26/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation
import PDFKit
import UIKit


class BlueprintBackView: PDFView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.loadPDFView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.loadPDFView()
	}
	
	func loadPDFView() {
		guard let path = Bundle.main.url(forResource: "test1", withExtension: "PDF") else { return }
		self.document = PDFDocument(url: path)
		self.autoScales = true
	}
}
