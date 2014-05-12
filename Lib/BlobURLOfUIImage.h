//
// Created by azu on 2014/05/12.
//


#import <Foundation/Foundation.h>


@interface BlobURLOfUIImage : NSObject
- (NSURL *)createUrlForUIImage:(UIImage *) image;

- (NSURL *)temporaryDirectoryURL;

// remove all temporary images form /tmp
- (void)cleanupTemporary;
@end