//
//  ViewController.swift
//  POC_Read2
//
//  Created by Felipe Izepe on 20/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let manager = PWDManager.shared
		manager.getData(path: "/Users/felipeizepe/Documents/BePID2018/Final Challenge/POC/PWD Read/Code/POC_Read2/POC_Read2/Test_FIles/test1.DWG") { success, erro, data in
			if success {
				let dView = self.view as! DrawView
				dView.objs = manager.getObjects()
				dView.setNeedsDisplay()
				
			}else {
				print(erro)
			}
		}
		
	}

}

