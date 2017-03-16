//
//  UIImageView+YFBlurtImage.m
//  BigShow1949
//
//  Created by zhht01 on 16/1/14.
//  Copyright © 2016年 BigShowCompany. All rights reserved.
//

#import "UIImageView+YFBlurtImage.h"
#import "UIImage+ImageEffects.h"

CGFloat const kYFBlurredImageDefaultBlurRadius            = 20.0;
CGFloat const kYFBlurredImageDefaultSaturationDeltaFactor = 1.8;


@implementation UIImageView (YFBlurtImage)

#pragma mark - LBBlurredImage Additions

- (void)setImageToBlur:(UIImage *)image
       completionBlock:(YFBlurredImageCompletionBlock)completion
{
    [self setImageToBlur:image
              blurRadius:kYFBlurredImageDefaultBlurRadius
         completionBlock:completion];
}

- (void)setImageToBlur:(UIImage *)image
            blurRadius:(CGFloat)blurRadius
       completionBlock:(YFBlurredImageCompletionBlock) completion
{
    NSParameterAssert(image);
    NSParameterAssert(blurRadius >= 0);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *blurredImage = [image applyBlurWithRadius:blurRadius
                                                 tintColor:nil
                                     saturationDeltaFactor:kYFBlurredImageDefaultSaturationDeltaFactor
                                                 maskImage:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = blurredImage;
            if (completion) {
                completion();
            }
        });
    });
}


@end
