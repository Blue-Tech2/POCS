//
//  PWDLinker.h
//  POC_Read
//
//  Created by Felipe Izepe on 20/09/18.
//  Copyright © 2018 Felipe Izepe. All rights reserved.
//

#ifndef PWDLinker_h
#define PWDLinker_h


#import <Foundation/Foundation.h>
#include "dwg_api.h"
#include "dwg.h"

@class PWDLinker;

@interface Dwg_Data : NSObject

-(int)dwg_read_file(char *filename, Dwg_Data *dwg);
-(int)dwg_decode_OBJECT (Bit_Chain *dat, Dwg_Object *obj)

@end


#endif /* PWDLinker_h */
