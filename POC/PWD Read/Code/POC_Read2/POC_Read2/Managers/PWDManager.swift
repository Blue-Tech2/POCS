//
//  PWDService.swift
//  POC_Read
//
//  Created by Felipe Izepe on 19/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation

class PWDManager {
	
	
	public static let shared: PWDManager = PWDManager()
	
	private let service = PWDLinkerC()
	
	private init () {
		
	}
	
	func getData(path: String, completion: @escaping (_ success: Bool, _ error: String?, _ data: Dwg_Data?) -> Void )  {
		let data = service.readFile(path: path)
		if let receivedData = data {
			completion(true, nil, receivedData)
		}else {
			completion(false, "Error reading file", nil)
		}
	}
	
	func getObjects() -> [Dwg_Object] {
		return self.service.getObjsArray()
	}
	
	func getCircle(index: Int) -> Dwg_Entity_CIRCLE? {
		return service.readCircle(index: index)
	}
	
	func getLine(index: Int) -> Dwg_Entity_LINE? {
		return service.readLine(index: index)
	}
	
	func getARC(index: Int) -> Dwg_Entity_ARC? {
		return service.readArc(index: index)
	}
	
	func getInsert(index: Int) -> Dwg_Entity_INSERT? {
		return service.readInsert(index: index)
	}
	
	func getText(index: Int) -> Dwg_Entity_TEXT? {
		return service.readText(index: index)
	}
	
	func getGroup(index: Int) -> Dwg_Object_GROUP? {
		return service.readGroup(index: index)
	}
	
	func getEllipse(index: Int) -> Dwg_Entity_ELLIPSE? {
		return service.readEllipse(index: index)
	}
}
