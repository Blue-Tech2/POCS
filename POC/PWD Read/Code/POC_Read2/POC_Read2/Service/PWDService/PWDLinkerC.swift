//
//  PWDLinkerC.swift
//  POC_Read
//
//  Created by Felipe Izepe on 20/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

import Foundation

class PWDLinkerC: PDWService {
	
	var objs:[Dwg_Object] = [Dwg_Object]();
	
	func readFile(path: String) -> Dwg_Data? {
		var data = PWDLinker().getData(path)
		self.objs = Array(UnsafeBufferPointer(start: data.object, count: Int(data.num_objects)))
		return data
	}
	
	func getObjsArray() -> [Dwg_Object]{
		return self.objs
	}
	
	func readCircle(index: Int) -> Dwg_Entity_CIRCLE? {
		return PWDLinker().getCircle(&objs[index])
	}
	
	func readLine(index: Int) -> Dwg_Entity_LINE? {
		return PWDLinker().getLine(&objs[index])
	}
	
	func readArc(index: Int) -> Dwg_Entity_ARC {
		return PWDLinker().getARC(&objs[index])
	}
	
	func readInsert(index: Int) -> Dwg_Entity_INSERT {
		return PWDLinker().getINSERT(&objs[index])
	}
	
	func readText(index: Int) -> Dwg_Entity_TEXT? {
		return PWDLinker().getText(&objs[index])
	}
	
	func readGroup(index: Int) -> Dwg_Object_GROUP? {
		return PWDLinker().getGROUP(&objs[index])
	}
	
	func readEllipse(index: Int) -> Dwg_Entity_ELLIPSE? {
		return PWDLinker().getEllipse(&objs[index])
	}
}
