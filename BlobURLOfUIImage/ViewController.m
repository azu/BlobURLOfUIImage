//
//  ViewController.m
//  BlobURLOfUIImage
//
//  Created by azu on 2014/05/12.
//  Copyright (c) 2014 azu. All rights reserved.
//

#import "ViewController.h"
#import "BlobURLOfUIImage.h"

@interface ViewController ()
@property(weak, nonatomic) IBOutlet UIWebView *contentWebView;

@property(nonatomic, strong) BlobURLOfUIImage *blobURLOfUIImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.blobURLOfUIImage = [[BlobURLOfUIImage alloc] init];
    [self.blobURLOfUIImage cleanupTemporary];
    [self.contentWebView loadHTMLString:self.htmlContent baseURL:[NSBundle mainBundle].bundleURL];
}

- (NSString *)htmlContent {
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"index" ofType:@"html"];
    NSString *contentHTML = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSURL *imageBlobURL = [self.blobURLOfUIImage createUrlForUIImage:[UIImage imageNamed:@"150x150.png"]];
    NSString *result = [contentHTML stringByReplacingOccurrencesOfString:@"{{img}}" withString:imageBlobURL.path];
    return result;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end