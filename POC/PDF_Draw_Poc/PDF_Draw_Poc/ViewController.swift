//
//  ViewController.swift
//  PDF_Draw_Poc
//
//  Created by Felipe Izepe on 26/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import UIKit
import PDFKit

class ViewController: UIViewController {
	@IBOutlet weak var editView: EditView!
	@IBOutlet weak var backView: BlueprintBackView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.loadViews()
	
	}

	
	func loadViews(){
		self.editView.loadView()
		self.editView.isUserInteractionEnabled = true
		self.backView.isUserInteractionEnabled = false
	}

	// MARK: Button action
	
	@IBAction func toRed(_ sender: Any) {
		self.editView.changeTrailColor(code: .red)
	}
	
	@IBAction func toBlue(_ sender: Any) {
		self.editView.changeTrailColor(code: .blue)
	}
	
	@IBAction func toGreen(_ sender: Any) {
		self.editView.changeTrailColor(code: .green)
	}
	
}

