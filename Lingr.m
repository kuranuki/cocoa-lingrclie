//
//  Lingr.m
//  LingrClie
//
//  Created by 倉貫 義人 on 09/02/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Lingr.h"


@implementation Lingr

NSString* APIKEY = @"SET YOUR KEY";

+ (NSString*)createSession {

	return [self callAPI:@"session/create"
		  inputParameter:[NSString stringWithFormat:@"api_key=%@", APIKEY]
			  resultPath:@"/response/session"];
}

+ (NSString*)destroySession:(NSString*)sessionID {
	
	NSURL* url = [NSURL URLWithString:@"http://www.lingr.com/api/session/destroy"];
	NSString* parameter = [NSString stringWithFormat:@"session=%@", sessionID];
	
	NSMutableURLRequest* urlRequest = [[NSMutableURLRequest alloc]initWithURL:url];
	[urlRequest setHTTPMethod:@"POST"];
	[urlRequest setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSURLResponse* response;
	NSError* error;
	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest
										   returningResponse:&response
													   error:&error];
	
	NSXMLDocument* document = [[NSXMLDocument alloc] initWithData:result options:0 error:NULL];
	if (!document) {
		return nil;
	}
	
	NSArray* nodes = [document nodesForXPath:@"/response/status" error:NULL];
	if ([nodes count] == 1) {
		return [[nodes objectAtIndex:0] stringValue];
	}
	return nil;
}

+ (id)	callAPI:(NSString*)apiUrl
inputParameter:(NSString*)parameter
	resultPath:(NSString*)path {

	NSString* urlString = [NSString stringWithFormat:@"http://www.lingr.com/api/%@", apiUrl];	
	NSURL* url = [NSURL URLWithString:urlString];
	
	NSMutableURLRequest* urlRequest = [[NSMutableURLRequest alloc]initWithURL:url];
	[urlRequest setHTTPMethod:@"POST"];
	[urlRequest setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSURLResponse* response;
	NSError* error;
	NSData* result = [NSURLConnection sendSynchronousRequest:urlRequest
										   returningResponse:&response
													   error:&error];
	
	NSXMLDocument* document = [[NSXMLDocument alloc] initWithData:result options:0 error:NULL];
	if (!document) {
		return nil;
	}
	
	NSLog([document stringValue]);
	
	NSArray* nodes = [document nodesForXPath:path error:NULL];
	if ([nodes count] != 1) {
		return nil;
	}
	return [[nodes objectAtIndex:0] stringValue];
}

@end
