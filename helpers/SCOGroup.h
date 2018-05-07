//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SCOGroup : NSObject
{
    NSString *_key;
    NSString *_title;
    NSArray *_friends;
}

+ (SCOGroup *)newGroup;
+ (SCOGroup *)groupFromDictionary:(NSDictionary *)arg1 withKey:(NSString *)arg2 ;
@property(retain, nonatomic) NSArray *friends; // @synthesize friends=_friends;
@property(retain, nonatomic) NSString *title; // @synthesize title=_title;
@property(retain, nonatomic) NSString *key; // @synthesize key=_key;
- (id)groupDictionary;

@end