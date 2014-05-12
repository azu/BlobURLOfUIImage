# BlobURLOfUIImage

Create NSURL from UIImage.

## Installation

``` sh
pod 'BlobURLOfUIImage'
```

## Usage

``` objc
BlobURLOfUIImage *blobURLOfUIImage = [[BlobURLOfUIImage alloc] init];
NSURL *imageBlobURL = [blobURLOfUIImage createUrlForUIImage:[UIImage imageNamed:@"150x150.png"]];
// => image url file:///...
```

### Use case

Run example.

Want to embed UIImage to HTML's `<img>` tag.

``` objc
NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"index" ofType:@"html"];
NSString *contentHTML = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
NSURL *imageBlobURL = [self.blobURLOfUIImage createUrlForUIImage:[UIImage imageNamed:@"150x150.png"]];
NSString *result = [contentHTML stringByReplacingOccurrencesOfString:@"{{img}}" withString:imageBlobURL.path];
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT