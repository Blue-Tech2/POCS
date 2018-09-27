//
//  PWDLinker.m
//  POC_Read2
//
//  Created by Felipe Izepe on 21/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POC_Read2-Bridging-Header.h"
#include "dwg_api.h"
#include "dwg.h"

@implementation PWDLinker

double model_xmin, model_ymin;
double page_width, page_height, scale;

-(Dwg_Data)getData:(const char *)path {
	int error;
	Dwg_Data dwg;
	error = dwg_read_file(path, &dwg);
	return dwg;
}

-(Dwg_Entity_TEXT) getText:(const Dwg_Object *)obj {
	return *obj->tio.entity->tio.TEXT;
}

-(Dwg_Entity_LINE) getLine:(const Dwg_Object *)obj {
	return *obj->tio.entity->tio.LINE;
}

-(Dwg_Entity_CIRCLE) getCircle:(const Dwg_Object *)obj {
	return *obj->tio.entity->tio.CIRCLE;
}

-(Dwg_Entity_ARC)getARC:(const Dwg_Object *)obj {
	return *obj->tio.entity->tio.ARC;
}

-(Dwg_Object_GROUP)getGROUP:(const Dwg_Object *)obj {
	return *obj->tio.object->tio.GROUP;
}

-(Dwg_Entity_INSERT)getINSERT:(const Dwg_Object *)obj {
	return *obj->tio.entity->tio.INSERT;
}

-(Dwg_Entity_ELLIPSE)getEllipse:(const Dwg_Object *)obj {
	return *obj->tio.entity->tio.ELLIPSE;
}

@end

