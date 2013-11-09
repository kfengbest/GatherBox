//
//  CreateVoteViewController.m
//  GatherBox
//
//  Created by Kaven Feng on 11/9/13.
//  Copyright (c) 2013 Kaven Feng. All rights reserved.
//

#import "CreateVoteViewController.h"
#import "CategoryView.h"

#define  PIC_WIDTH 80
#define  PIC_HEIGHT 80
#define  INSETS 10

@interface CreateVoteViewController ()
{
    CategoryView*   mCategoryView;
}
@end

@implementation CreateVoteViewController

@synthesize buttonWithImage;
@synthesize layerMaskedCircleImageView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    addedPicArray =[[NSMutableArray alloc]init];
    [self refreshScrollView];
    
    
    mCategoryView = [[CategoryView alloc] initWithFrame:CGRectMake(0, 480, 320, 200)];
    [self.view addSubview:mCategoryView];
    
    // show how a button looks with returned image set as button image without resizing
    self.buttonWithImage = [[UIButton alloc] initWithFrame:CGRectMake(20, 10, 120, 120)];
    buttonWithImage.layer.cornerRadius = 20.0f;
    buttonWithImage.layer.borderColor = [UIColor blueColor].CGColor;
    buttonWithImage.layer.borderWidth = 1.0f;
    [buttonWithImage setImage:[UIImage imageNamed:@"Icon.png"] forState:UIControlStateNormal];
    [buttonWithImage addTarget:self action:@selector(selectCategory) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonWithImage];
    
    
    // displaying the image in a circle by using a shape layer
    // layer fill color controls the masking
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    UIBezierPath *layerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(1, 1, 118, 118)];
    maskLayer.path = layerPath.CGPath;
    maskLayer.fillColor = [UIColor blackColor].CGColor;

    
    // use another view for clipping so that when the image size changes, the masking layer does not need to be repositioned
    UIView *clippingViewForLayerMask = [[UIView alloc] initWithFrame:CGRectMake(160, 180, 120, 120)];
    clippingViewForLayerMask.layer.mask = maskLayer;
    clippingViewForLayerMask.clipsToBounds = YES;
    [self.view addSubview:clippingViewForLayerMask];
    
    self.layerMaskedCircleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    layerMaskedCircleImageView.backgroundColor = [UIColor yellowColor];
    [clippingViewForLayerMask addSubview:layerMaskedCircleImageView];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectCategory
{
    [UIView beginAnimations:@"ShowCategory" context:nil];
    [UIView setAnimationDuration:0.5];
    mCategoryView.frame = CGRectMake(0, 200, 320, 200);
    [UIView commitAnimations];
}


- (IBAction)clearPics:(id)sender {
    for (UIImageView *img in addedPicArray)
    {
        [img removeFromSuperview];
    }
    [addedPicArray removeAllObjects];
    
    CABasicAnimation *positionAnim=[CABasicAnimation animationWithKeyPath:@"position"];
    [positionAnim setFromValue:[NSValue valueWithCGPoint:CGPointMake(_plusButton.center.x, _plusButton.center.y)]];
    [positionAnim setToValue:[NSValue valueWithCGPoint:CGPointMake(INSETS+PIC_WIDTH/2, _plusButton.center.y)]];
    [positionAnim setDelegate:self];
    [positionAnim setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [positionAnim setDuration:0.25f];
    
    [_plusButton.layer addAnimation:positionAnim forKey:nil];
    
    [_plusButton setCenter:CGPointMake(INSETS+PIC_WIDTH/2, _plusButton.center.y)];
    [self refreshScrollView];
}

- (IBAction)addPic:(id)sender {
    
    
    CABasicAnimation *positionAnim=[CABasicAnimation animationWithKeyPath:@"position"];
    [positionAnim setFromValue:[NSValue valueWithCGPoint:CGPointMake(_plusButton.center.x, _plusButton.center.y)]];
    [positionAnim setToValue:[NSValue valueWithCGPoint:CGPointMake(_plusButton.center.x+INSETS+PIC_WIDTH, _plusButton.center.y)]];
    [positionAnim setDelegate:self];
    [positionAnim setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [positionAnim setDuration:0.25f];
    [_plusButton.layer addAnimation:positionAnim forKey:nil];
    [_plusButton setCenter:CGPointMake(_plusButton.center.x+INSETS+PIC_WIDTH, _plusButton.center.y)];
    
    UIImageView *aImageView=[[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"boy"]]autorelease];
    [aImageView setFrame:CGRectMake(INSETS-90, INSETS, PIC_WIDTH, PIC_HEIGHT)];
    [addedPicArray addObject:aImageView];
    [_picScroller addSubview:aImageView];
    
    for (UIImageView *img in addedPicArray) {
        
        CABasicAnimation *positionAnim=[CABasicAnimation animationWithKeyPath:@"position"];
        [positionAnim setFromValue:[NSValue valueWithCGPoint:CGPointMake(img.center.x, img.center.y)]];
        [positionAnim setToValue:[NSValue valueWithCGPoint:CGPointMake(img.center.x+INSETS+PIC_WIDTH, img.center.y)]];
        [positionAnim setDelegate:self];
        [positionAnim setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [positionAnim setDuration:0.25f];
        [img.layer addAnimation:positionAnim forKey:nil];
        
        [img setCenter:CGPointMake(img.center.x+INSETS+PIC_WIDTH, img.center.y)];
    }
    
    
    
    [self refreshScrollView];
}

- (void)refreshScrollView
{
    CGFloat width=100*(addedPicArray.count)<300?320:100+addedPicArray.count*90;
    
    CGSize contentSize=CGSizeMake(width, 100);
    [_picScroller setContentSize:contentSize];
    [_picScroller setContentOffset:CGPointMake(width<320?0:width-320, 0) animated:YES];
    
}

@end
