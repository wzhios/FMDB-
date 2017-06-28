//
//  ZWBundleTableViewController.h
//  Pods
//
//  Created by zhuwei on 15/7/16.
//
//

#import <UIKit/UIKit.h>
#undef	IMPLEMENTATION_SETUP_BUNDLE
#define IMPLEMENTATION_SETUP_BUNDLE( __bundleName ) \
- (void)setupBundle {   \
    self.bundleName = __bundleName;             \
    NSString* path = [[NSBundle mainBundle] pathForResource:__bundleName ofType:@"bundle"];\
    NSBundle* localBundle = [NSBundle bundleWithPath:path]; \
    if(localBundle != nil) {    \
        self.bundle = localBundle;  \
    } \
}   \


@interface ZWBundleTableViewController : UITableViewController

@property (strong, nonatomic) NSBundle*     bundle;
@property (strong, nonatomic) NSString*     bundleName;

- (NSString *)localStringForKey:(NSString *)key;

- (UIImage *)imageWithName:(NSString *)imgName;

@end
