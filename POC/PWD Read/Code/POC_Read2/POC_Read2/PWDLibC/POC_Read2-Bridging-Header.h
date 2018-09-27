//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <Foundation/Foundation.h>
#include "dwg_api.h"
#include "dwg.h"



@class PWDLinker;

@interface PWDLinker : NSObject
-(Dwg_Data)getData:(const char *)path;

-(Dwg_Entity_TEXT) getText:(const Dwg_Object *)obj;

-(Dwg_Entity_LINE) getLine:(const Dwg_Object *)obj;

-(Dwg_Entity_CIRCLE) getCircle:(const Dwg_Object *)obj;

-(Dwg_Entity_ARC)getARC:(const Dwg_Object *)obj;

-(Dwg_Entity_INSERT)getINSERT:(const Dwg_Object *)obj;

-(Dwg_Object_GROUP)getGROUP:(const Dwg_Object *)obj;

-(Dwg_Entity_ELLIPSE)getEllipse:(const Dwg_Object *)obj;

@end
