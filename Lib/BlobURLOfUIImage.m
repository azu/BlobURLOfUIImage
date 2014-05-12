//
// Created by azu on 2014/05/12.
//


#import "BlobURLOfUIImage.h"

@implementation BlobURLOfUIImage {

}
- (NSURL *)temporaryDirectoryURL {
    NSString *directoryName = @"BlobURLOfUIImageCache";
    NSURL *directoryURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:directoryName] isDirectory:YES];
    return directoryURL;
}

- (void)createTemporaryDirectory {
    NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtURL:self.temporaryDirectoryURL withIntermediateDirectories:YES attributes:nil error:&error];
    if (error) {
        NSLog(@"CreateDir Error = %@", error);
    }
}

- (void)cleanupTemporary {
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtURL:self.temporaryDirectoryURL error:&error];
}

- (NSURL *)createSaveURL {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    return [[self.temporaryDirectoryURL URLByAppendingPathComponent:uuid] URLByAppendingPathExtension:@"png"];
}

- (NSURL *)saveAsFile:(NSData *) fileData {
    NSURL *saveURL = [self createSaveURL];
    if (![fileData writeToURL:saveURL atomically:YES]) {
        return nil;
    }
    return saveURL;
}

- (NSURL *)createUrlForUIImage:(UIImage *) image {
    if (image == nil) {
        return nil;
    }
    [self createTemporaryDirectory];
    NSData *data = [NSData dataWithData:UIImagePNGRepresentation(image)];
    return [self saveAsFile:data];
}


@end