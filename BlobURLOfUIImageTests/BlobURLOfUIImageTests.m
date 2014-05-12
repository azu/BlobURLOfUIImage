//
//  BlobURLOfUIImageTests.m
//  BlobURLOfUIImageTests
//
//  Created by azu on 2014/05/12.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BlobURLOfUIImage.h"

@interface BlobURLOfUIImageTests : XCTestCase

@end

@implementation BlobURLOfUIImageTests {
    BlobURLOfUIImage *blobURLOfUIImage;
}

- (void)setUp {
    [super setUp];
    blobURLOfUIImage = [[BlobURLOfUIImage alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCreateBlobURL {
    NSURL *blobURL = [blobURLOfUIImage createUrlForUIImage:[UIImage imageNamed:@"150x150.png"]];
    XCTAssertNotNil(blobURL);
}

- (void)testWhenNotImage_Return_NIL {
    NSURL *blobURL = [blobURLOfUIImage createUrlForUIImage:nil];
    XCTAssertNil(blobURL);
}

- (void)testCleanup {
    NSURL *blobURL = [blobURLOfUIImage createUrlForUIImage:[UIImage imageNamed:@"150x150.png"]];
    XCTAssert([[NSFileManager defaultManager] fileExistsAtPath:blobURLOfUIImage.temporaryDirectoryURL.path]);

    [blobURLOfUIImage cleanupTemporary];
    XCTAssertFalse([[NSFileManager defaultManager] fileExistsAtPath:blobURLOfUIImage.temporaryDirectoryURL.path]);

}

@end
