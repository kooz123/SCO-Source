#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SrsHelper : NSObject
{
    NSArray *_enabledFiltersForSnapchat;
    NSDictionary *_enabledFiltersDictionaryForSnapchat;
    NSArray *_enabledImagesFiltersForSnapchat;
    NSDictionary *_enabledImagesFiltersDictionaryForSnapchat;
}

+ (id)filtersByAddingEnabledFiltersToSnapchatDictionaryFilters:(id)arg1;
+ (id)filtersByAddingEnabledFiltersToSnapchatFilters:(id)arg1;
+ (id)createAndSaveFilterForImage:(id)arg1;
+ (_Bool)deleteFilter:(id)arg1;
+ (id)filterForKey:(id)arg1;
+ (void)saveEnabledFiltersKeys:(id)arg1;
+ (id)enabledFiltersKeys;
+ (long long)enabledFiltersCount;
+ (void)fetchEnabledFiltersWithCompletion:(CDUnknownBlockType)arg1;
+ (void)fetchFiltersWithCompletion:(CDUnknownBlockType)arg1;
+ (id)scoffiltersDirectoryPath;
+ (id)filtersDirectoryPath;
+ (id)sharedInstance;
@property(retain, nonatomic) NSDictionary *enabledImagesFiltersDictionaryForSnapchat; // @synthesize enabledImagesFiltersDictionaryForSnapchat=_enabledImagesFiltersDictionaryForSnapchat;
@property(retain, nonatomic) NSArray *enabledImagesFiltersForSnapchat; // @synthesize enabledImagesFiltersForSnapchat=_enabledImagesFiltersForSnapchat;
@property(retain, nonatomic) NSDictionary *enabledFiltersDictionaryForSnapchat; // @synthesize enabledFiltersDictionaryForSnapchat=_enabledFiltersDictionaryForSnapchat;
@property(retain, nonatomic) NSArray *enabledFiltersForSnapchat; // @synthesize enabledFiltersForSnapchat=_enabledFiltersForSnapchat;
- (void)updateEnabledFiltersForSnapchatWithCompletion:(CDUnknownBlockType)arg1;

@end
