//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <CoreLocation/CoreLocation.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface SCOUserPrefs : NSObject

+ (SCOUserPrefs *)standardDefaults;
@property(retain, nonatomic) NSString *plistPath; // @synthesize plistPath=_plistPath;
@property(retain, nonatomic) NSMutableDictionary *dictionary; // @synthesize dictionary=_dictionary;
@property(retain, nonatomic) NSMutableDictionary *defaultsDictionary; // @synthesize defaultsDictionary=_defaultsDictionary;
- (_Bool)empty;
- (_Bool)synchronize;
- (void)removeObjectForKey:(id)arg1;
- (void)setDate:(id)arg1 forKey:(id)arg2;
- (void)setData:(id)arg1 forKey:(id)arg2;
- (void)setDictionary:(id)arg1 forKey:(id)arg2;
- (void)setArray:(id)arg1 forKey:(id)arg2;
- (void)setString:(id)arg1 forKey:(id)arg2;
- (void)setDouble:(double)arg1 forKey:(id)arg2;
- (void)setFloat:(float)arg1 forKey:(id)arg2;
- (void)setInteger:(long long)arg1 forKey:(id)arg2;
- (void)setBool:(_Bool)arg1 forKey:(id)arg2;
- (void)setObject:(id)arg1 forKey:(id)arg2;
- (NSDate *)dateForKey:(id)arg1;
- (NSData *)dataForKey:(id)arg1;
- (NSDictionary *)dictionaryForKey:(id)arg1;
- (NSArray *)arrayForKey:(id)arg1;
- (NSString *)stringForKey:(id)arg1;
- (double)doubleForKey:(id)arg1;
- (float)floatForKey:(id)arg1;
- (long long)integerForKey:(id)arg1;
- (_Bool)boolForKey:(id)arg1;
- (id)objectForKey:(id)arg1;
- (void)registerDefaults:(id)arg1;
- (id)initWithPlistPath:(id)arg1;

@end

