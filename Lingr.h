//
//  Lingr.h
//  LingrClie
//
//  Created by 倉貫 義人 on 09/02/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Lingr : NSObject {
}

+ (NSString*)createSession;
+ (NSString*)destroySession:(NSString*)sessionID;

+ (id)	callAPI:(NSString*)apiUrl
 inputParameter:(NSString*)parameter
	 resultPath:(NSString*)path;

@end
