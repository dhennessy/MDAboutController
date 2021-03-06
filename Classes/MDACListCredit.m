//
//  MDACListCredit.m
//  MDAboutController
//
//  Created by Dimitri Bouniol on 5/23/11.
//  Copyright 2011 Mochi Development Inc. All rights reserved.
//
//  Copyright (c) 2010 Dimitri Bouniol, Mochi Development, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  Also, it'd be super awesome if you left in the credit line generated
//  automatically by the code that links back to this page :)
//

#import "MDACListCredit.h"
#import "MDACCreditItem.h"

@implementation MDACListCredit

@synthesize title;

- (id)initWithTitle:(NSString *)aTitle
{
    if ((self = [super initWithType:@"List"])) {
        self.title = aTitle;
        items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithType:(NSString *)aType
{
    return [self initWithTitle:nil];
}

+ (id)creditWithType:(NSString *)aType
{
    return [self listCreditWithTitle:nil];
}

+ (id)listCreditWithTitle:(NSString *)aTitle
{
    return [[[self alloc] initWithTitle:aTitle] autorelease];
}

- (id)initWithDictionary:(NSDictionary *)aDict
{
    if ((self = [self initWithTitle:[aDict objectForKey:@"Title"]])) {
        NSArray *itemsList = [aDict objectForKey:@"Items"];
        for (NSDictionary *item in itemsList) {
            [self addItem:[MDACCreditItem itemWithDictionary:item]];
        }
    }
    return self;
}

+ (id)listCreditWithDictionary:(NSDictionary *)aDict
{
    return [[[self alloc] initWithDictionary:aDict] autorelease];
}

- (NSUInteger)count
{
    return [items count];
}

- (void)addItem:(MDACCreditItem *)anItem
{
    [items addObject:anItem];
}

- (void)removeItem:(MDACCreditItem *)anItem
{
    [items removeObject:anItem];
}

- (MDACCreditItem *)itemAtIndex:(NSUInteger)index
{
    return [items objectAtIndex:index];
}

- (void)dealloc {
    [title release];
    [items release];
    [super dealloc];
}

@end