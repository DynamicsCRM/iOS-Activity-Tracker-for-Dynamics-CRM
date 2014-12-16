// iOS Activity Tracker Sample app for Dynamics CRM 1.0
//
// Copyright (c) Microsoft Corporation
//
// All rights reserved.
//
// MIT License
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software
// and associated documentation files (the ""Software""), to deal in the Software without
// restriction, including without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
// software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED *AS IS*, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
// BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

//  XMLParsingHelper.m

#import "XMLParsingHelper.h"

#import <libxml/tree.h>
#import <libxml/parser.h>
#import <libxml/xpath.h>
#import <libxml/xpathInternals.h>

@interface XMLParsingHelper ()

@property (nonatomic) xmlDoc *docPtr;

@end

@implementation XMLParsingHelper

// The methods in this class parse out the XML returned from the SOAP Endpoint
// This class leverages the built-in libxml library

+ (XMLParsingHelper *)parsingHelperWithXML:(NSString *)xmlDocString
{
    XMLParsingHelper *parsingHelper = [[XMLParsingHelper alloc] init];
    
    // Get the data from the string and create an XML Document
    NSData *docData = [xmlDocString dataUsingEncoding:NSUTF8StringEncoding];
    
    parsingHelper.docPtr = xmlReadMemory([docData bytes], (int)[docData length], "", NULL, XML_PARSE_RECOVER);
    
    return parsingHelper;
}

+ (NSDictionary *)createDictionaryFromNode:(xmlNode *)currentNode parentDict:(NSMutableDictionary *)parent
{
	NSMutableDictionary *retVal = [NSMutableDictionary dictionary];
	
    NSString *nodeName;
	if (currentNode->name)
	{
		nodeName = [NSString stringWithCString:(const char *)currentNode->name encoding:NSUTF8StringEncoding];
		[retVal setObject:nodeName forKey:@"nodeName"];
	}
	
	if (currentNode->content && currentNode->type != XML_DOCUMENT_TYPE_NODE)
	{
		NSString *nodeContent = [NSString stringWithCString:(const char *)currentNode->content encoding:NSUTF8StringEncoding];
		
		if ([[retVal objectForKey:@"nodeName"] isEqual:@"text"] && parent)
		{
			nodeContent = [nodeContent stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
			
			NSString *parentContent = [parent objectForKey:@"nodeContent"];
			NSString *newContent = nil;
			if (parentContent)
			{
				newContent = [parentContent stringByAppendingString:nodeContent];
			}
			else
			{
				newContent = nodeContent;
			}
            
			[parent setObject:newContent forKey:[parent objectForKey:@"nodeName"]];
			return nil;
		}
		
		[retVal setObject:nodeContent forKey:@"nodeContent"];
	}
    
	xmlNodePtr childNode = currentNode->children;
	if (childNode)
	{
		NSMutableArray *childContentArray = [NSMutableArray array];
		while (childNode)
		{
			NSDictionary *childDictionary = [XMLParsingHelper createDictionaryFromNode:childNode parentDict:retVal];
			if (childDictionary)
			{
				[childContentArray addObject:childDictionary];
			}
			childNode = childNode->next;
		}
		if ([childContentArray count] > 0)
		{
			[retVal setObject:childContentArray forKey:nodeName];
		}
	}
	
	return retVal;
}

// xPath Search
// Sample Return Node:
/*
 {
    Attributes = 
    (
        {
            KeyValuePairOfstringanyType =
            (
                {
                    key = fullname;
                    nodeName = key;
                },
                {
                    nodeName = value;
                    value = "Yvonne McKay (sample)";
                }
            );
            nodeName = KeyValuePairOfstringanyType;
        },
        {
            KeyValuePairOfstringanyType =
            (
                {
                    key = accountname;
                    nodeName = key;
                },
                {
                    nodeName = value;
                    value = 
                    (
                        {
                            AttributeLogicalName = name;
                            nodeName = AttributeLogicalName;
                        },
                        {
                            EntityLogicalName = account;
                            nodeName = EntityLogicalName;
                        },
                        {
                            Value = "Fourth Coffee (sample)";
                            nodeName = Value;
                        }
                    );
                }
            );
            nodeName = KeyValuePairOfstringanyType;
        }
    );
    nodeName = Attributes;
 }
*/

- (NSArray *)xPathSearchFor:(NSString *)xPathQuery
{
    // We start out with a standard XPath Query
    xmlXPathContext *pathContext;
    xmlXPathObject *pathObject;
    
    pathContext = xmlXPathNewContext(self.docPtr);
    if(pathContext == NULL)
	{
		NSLog(@"Path Context Creation Failed");
		return nil;
    }
    
    pathObject = xmlXPathEvalExpression((xmlChar *)[xPathQuery cStringUsingEncoding:NSUTF8StringEncoding], pathContext);
    if(pathObject == NULL)
    {
		NSLog(@"XPath Evalutaion Failed");
		return nil;
    }
	
	xmlNodeSet *nodes = pathObject->nodesetval;
	if (!nodes)
	{
		NSLog(@"There were no nodes");
		return nil;
	}
	
    // Grab the nodes that were returned from the query and parse them into a useable object
	NSMutableArray *resultNodes = [NSMutableArray array];
	for (NSInteger i = 0; i < nodes->nodeNr; i++)
	{
		NSDictionary *nodeDictionary = [XMLParsingHelper createDictionaryFromNode:nodes->nodeTab[i] parentDict:nil];
		if (nodeDictionary)
		{
			[resultNodes addObject:nodeDictionary];
		}
	}
    
    xmlXPathFreeObject(pathObject);
    xmlXPathFreeContext(pathContext);
    
    return resultNodes;
}

- (void)dealloc
{
    xmlFreeDoc(self.docPtr);
}

@end