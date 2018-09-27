//
//  PWDService.swift
//  POC_Read
//
//  Created by Felipe Izepe on 20/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation


protocol PDWService {
	func readFile(path: String) -> Dwg_Data
	func getPWDObjects(dwg: Dwg_Data) -> [Dwg_Object]
}
