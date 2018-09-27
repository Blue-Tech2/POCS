//
//  PWDService.swift
//  POC_Read
//
//  Created by Felipe Izepe on 20/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation


protocol PDWService {
	func readFile(path: String) -> Dwg_Data?
	
	func getObjsArray() -> [Dwg_Object]
	
	func readCircle(index: Int) -> Dwg_Entity_CIRCLE?
	
	func readLine(index: Int) -> Dwg_Entity_LINE?
	
	func readArc(index: Int) -> Dwg_Entity_ARC
	
	func readInsert(index: Int) -> Dwg_Entity_INSERT
	
	func readText(index: Int) -> Dwg_Entity_TEXT?
	
	func readEllipse(index: Int) -> Dwg_Entity_ELLIPSE?
}
