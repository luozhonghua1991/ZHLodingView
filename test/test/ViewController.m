//
//  ViewController.m
//  test
//
//  Created by Weasley Qi on 14-6-16.
//  Copyright (c) 2014年 weasleyqi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize label;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getHome:(id)sender {
    NSString *homePath = NSHomeDirectory();
    label.text = homePath;
    NSLog(@"Home目录：%@",homePath);
}
- (IBAction)getDocument:(id)sender {
    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [docPath objectAtIndex:0];
    NSLog(@"Documents目录：%@",documentsPath);
    label.text = documentsPath;
}
- (IBAction)getLibrary:(id)sender {
    NSArray *libsPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libPath = [libsPath objectAtIndex:0];
    NSLog(@"Library目录：%@",libPath);
    label.text = libPath;
}
- (IBAction)getCache:(id)sender {
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    NSLog(@"Cache目录：%@",cachePath);
    label.text = cachePath;
}
- (IBAction)getTmp:(id)sender {
    NSString *tempPath = NSTemporaryDirectory();
    NSLog(@"temp目录：%@",tempPath);
    label.text = tempPath;
}
- (IBAction)writeFile:(id)sender {
    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [docPath objectAtIndex:0];
    //写入文件
    if (!documentsPath) {
        NSLog(@"目录未找到");
        label.text = @"目录未找到";
    }else {
        NSString *filePaht = [documentsPath stringByAppendingPathComponent:@"test.txt"];
        NSArray *array = [NSArray arrayWithObjects:@"Title",@"Contents", nil];
        [array writeToFile:filePaht atomically:YES];
        label.text = @"写入成功";
    }
}
- (IBAction)readFile:(id)sender {
    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [docPath objectAtIndex:0];
    NSString *readPath = [documentsPath stringByAppendingPathComponent:@"test.txt"];
    NSArray *fileContent = [[NSArray alloc] initWithContentsOfFile:readPath];
    NSLog(@"文件内容：%@",fileContent);
    label.text = @"读取成功";
}

@end
