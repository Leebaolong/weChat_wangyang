//
//  DS_BaseChatRoomControllerManager.m
//  WeChat
//
//  Created by wangyang on 16/6/14.
//  Copyright © 2016年 wangyang. All rights reserved.
//

#import "DS_BaseChatRoomControllerManager.h"
#import "DS_ControllerTool.h"
#import "DS_BaseChatRoomController.h"
#import "DS_PhotoAlbumGroupViewController.h"

@interface DS_BaseChatRoomControllerManager ()

@end

@implementation DS_BaseChatRoomControllerManager
+ (instancetype)shareManager
{
    static DS_BaseChatRoomControllerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [self new];
    });
    return manager;
}

+ (void)openPhotoWithSuccess:(void (^)(NSArray *))photos
{
    UIViewController *vc = [DS_ControllerTool topViewController];
    DS_PhotoAlbumGroupViewController *groupViewController = [[DS_PhotoAlbumGroupViewController alloc] init];
    groupViewController.firstFlag = YES;
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:groupViewController];
    [vc presentViewController:navi animated:YES completion:nil];
}

+ (void)takePictureWithSuccess:(void (^)(UIImage *))picture
{
    DS_BaseChatRoomController *vc = (DS_BaseChatRoomController *)[DS_ControllerTool topViewController];
    UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
    }
    pickerImage.delegate = vc;
    pickerImage.allowsEditing = NO;
    [vc presentViewController:pickerImage animated:YES completion:nil];
}
@end
