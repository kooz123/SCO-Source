#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Sr : NSObject
{
    NSString *_key;
    NSString *_path;
    NSDate *_lastModDate;
}

@property(retain, nonatomic) NSDate *lastModDate; // @synthesize lastModDate=_lastModDate;
@property(retain, nonatomic) NSString *path; // @synthesize path=_path;
@property(retain, nonatomic) NSString *key; // @synthesize key=_key;

- (NSData *)imageData;
- (UIImage *)image;
- (NSDictionary *)snapchatFilterDictionary;

@end