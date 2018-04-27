#import "SrsHelper.h"
#import "Sr.h"

// S       rsHe

@implementation SrsHelper

+ (SrsHelper *)sharedInstance {
    static SrsHelper *__sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[self alloc] init];
    });
    
    return __sharedInstance;
}
+ (NSString *)filtersDirectoryPath {
	NSString * docsDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
	NSString *srsPath = [docsDir stringByAppendingPathComponent:@"Srs"];

	BOOL isDirectory = NO;
    if (![[NSFileManager defaultManager] fileExistsAtPath:srsPath isDirectory:&isDirectory])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:srsPath withIntermediateDirectories:YES attributes:nil error:nil];        
    }
    return srsPath;
}

+ (NSString *)scoffiltersDirectoryPath {
	NSString * docsDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
	NSString *srsPath = [docsDir stringByAppendingPathComponent:@"scof"];
	BOOL isDirectory = NO;
    if (![[NSFileManager defaultManager] fileExistsAtPath:srsPath isDirectory:&isDirectory])
    {
        [[NSFileManager defaultManager] createDirectoryAtPath:srsPath withIntermediateDirectories:YES attributes:nil error:nil];        
    }
    return srsPath;
}

+ (void)fetchFiltersWithCompletion:(void (^)(NSArray *filters))completion {
	NSString *filtersDirectoryPath = [[self class] filtersDirectoryPath];
	NSArray *contentsOfDir = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:filtersDirectoryPath error:nil];
	if (contentsOfDir) {

		NSMutableArray *filtersArray = [NSMutableArray new];
		for(NSString *file in contentsOfDir) {
			NSString *fileExt = [file pathExtension];
			if ([fileExt isEqualToString:@"png"]) {
				NSString *fileFullPath = [filtersDirectoryPath stringByAppendingPathComponent:file];
				NSDictionary* attr = [[NSFileManager defaultManager] attributesOfItemAtPath:fileFullPath error:nil];
				if(attr) {
					NSDate *fileDate = (NSDate*)[attr objectForKey:NSFileModificationDate]; 
					NSString *fileKey = [[fileFullPath lastPathComponent] stringByDeletingPathExtension];
					Sr *filterFile = [[Sr alloc] init];
					[filterFile setKey:fileKey];
					[filterFile setPath:fileFullPath];
					[filterFile setLastModDate:fileDate];
					[filtersArray addObject:filterFile];

				}
			}
		}

		NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"lastModDate" ascending:NO]];
    	NSArray *filtersArraySorted = [filtersArray sortedArrayUsingDescriptors:sortDescriptors];

    	completion(filtersArraySorted);
	}
	completion(nil);
}
@end