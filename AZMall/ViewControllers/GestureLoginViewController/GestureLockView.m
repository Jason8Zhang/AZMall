//
//  GestureLockView.m
//  AZMall
//
//  Created by jason on 15/9/28.
//  Copyright © 2015年 jason. All rights reserved.
//

#import "GestureLockView.h"
#define kLLBaseCircleNumber 10000       // tag基数
#define kCircleMargin 40.0              // 圆点离屏幕左边距
#define kCircleDiameter 58.0            // 圆点直径
#define kLLCircleAlpha 1.0              // 圆点透明度
#define kLLLineWidth 4.0               // 线条宽
#define kLLLineColor [UIColor colorWithRed:0/255.0 green:160.0/255.0 blue:233.0/255.0 alpha:0.8] // 线条色蓝
#define kLLLineColorWrong [UIColor colorWithRed:220.0/255.0 green:83.0/255.0 blue:0/255.0 alpha:0.8] // 线条色红
@interface GestureLockView()
{
    CGPoint currentPoint;
    NSMutableArray *arrSelectedBtnArray;
    NSMutableArray *arrButtonArrays;
    NSMutableArray *arrBtnArray;
    NSMutableArray *arrBtnOrigal;
    BOOL isDrawing;
    BOOL isWrongColor;
    NSTimer *timer;
}

@end

@implementation GestureLockView
@synthesize delegate;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init{
    if (self == [super init]) {
        self.clipsToBounds = YES;
        arrSelectedBtnArray = [NSMutableArray new];
        arrButtonArrays = [NSMutableArray new];
        arrBtnArray = [NSMutableArray new];
        arrBtnOrigal = [NSMutableArray new];
        [self initGestureLockView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self == [super initWithCoder:aDecoder]) {
        self.clipsToBounds = YES;
        arrSelectedBtnArray = [NSMutableArray new];
        arrButtonArrays = [NSMutableArray new];
        arrBtnArray = [NSMutableArray new];

        [self initGestureLockView];
    }
    return self;
}

-(void) initGestureLockView{
    for (int i = 0; i < 9; i++) {
//        int x = kCircleMargin + i * ( kCircleDiameter + (self.bounds.size.width - kCircleDiameter * 3 - kCircleMargin * 2));
//        int y = kCircleMargin + i * ( kCircleDiameter + (self.bounds.size.height - kCircleDiameter * 3 - kCircleMargin * 2));
        int x = kCircleMargin + (i%3) * (kCircleDiameter+(self.bounds.size.width-kCircleMargin*2 + kCircleDiameter *3)/2);
        int y = kCircleMargin + (i/3) * (kCircleDiameter+(self.bounds.size.width-kCircleMargin*2 + kCircleDiameter *3)/2);
        
        
        UIButton *btnLock = [[UIButton alloc] initWithFrame:CGRectMake(x ,y, kCircleDiameter, kCircleDiameter)];
        btnLock.tag = kLLBaseCircleNumber + i + 1;
        [btnLock setBackgroundImage:[UIImage imageNamed:@"circle_normal"] forState:UIControlStateNormal];
        [btnLock setBackgroundImage:[UIImage imageNamed:@"circle_selected"] forState:UIControlStateSelected];
        btnLock.alpha = kLLCircleAlpha;
        btnLock.userInteractionEnabled = NO;
        [self addSubview:btnLock];
        [arrButtonArrays addObject:btnLock];
        NSLog(@"btn ==> frame %@",btnLock);
        
    }
    self.backgroundColor = [UIColor clearColor];
}

#pragma -mark touch 事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch began");
    isDrawing = NO;
    if (isWrongColor) {
        [self clearColorAndSelectedButton];
    }
    CGPoint position = [[touches anyObject] locationInView:self];
    [self updateBtnPosition:position];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch moved");
    isDrawing = YES;
    CGPoint position = [[touches anyObject] locationInView:self];
    [self updateBtnPosition:position];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch cancelled");
    [self endPosition];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch ended");
    [self endPosition];
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet *)touches{
    
}

#pragma -mark 事件处理
- (void)updateBtnPosition:(CGPoint)point{
    currentPoint = point;
    for (UIButton *aBtn in arrButtonArrays) {
        CGFloat xOffset = currentPoint.x - aBtn.center.x;
        CGFloat yOffset = currentPoint.y - aBtn.center.y;
        if (fabs(xOffset) < 29 && fabs(yOffset)) {
            aBtn.selected = YES;
            [arrSelectedBtnArray addObject:aBtn];
        }
        
    }
    [self setNeedsDisplay];
}

- (void)endPosition{
    NSString *strLockString = @"";
    for (UIButton *tmpBtn in  arrSelectedBtnArray) {
        strLockString = [strLockString stringByAppendingString:[NSString stringWithFormat:@"%ld.",(long)tmpBtn.tag]];
    }
    if ([self.delegate respondsToSelector:@selector(gestureLockString:)]) {
        if (strLockString != nil && strLockString.length >0) {
             [self.delegate gestureLockString:strLockString];
        }
        else{
            [self.delegate gestureLockString:@"The strLockString is nil !"];
        }
       
    }
}

- (void)clearColorAndSelectedButton{
    if (!isDrawing) {
        [self clearColor];
        [self clearSelectedButton];
    }
}

- (void)clearColor{
    if (isWrongColor) {
        isWrongColor = NO;
        for (UIButton* aBtn in arrSelectedBtnArray) {
            [aBtn setBackgroundImage:[UIImage imageNamed:@"circle_selected"] forState:UIControlStateSelected];
        }
    }
}

- (void)clearSelectedButton{
    for (UIButton *aBtn in arrSelectedBtnArray) {
        aBtn.selected = NO;
    }
    [arrSelectedBtnArray removeAllObjects];
    [self setNeedsDisplay];
}

#pragma -mark 画线
- (void)drawRect:(CGRect)rect{
    if (arrSelectedBtnArray.count > 0) {
        CGContextRef context;
        isWrongColor?[kLLLineColorWrong set]:[kLLLineColor set];
        CGContextSetLineWidth(context, kLLLineWidth);
        CGPoint addLines[9];
        int count = 0;
        for (UIButton *aBtn in arrSelectedBtnArray) {
            CGPoint tmpPoint = CGPointMake(aBtn.center.x, aBtn.center.y);
            addLines[count++] = tmpPoint;
            CGRect circleRect = CGRectMake(aBtn.center.x - kLLLineWidth / 2,aBtn.center.y - kLLLineWidth / 2, kLLLineWidth,kLLLineWidth );
            CGContextSetFillColorWithColor(context, kLLLineColor.CGColor);
            CGContextFillEllipseInRect(context, circleRect);
        }
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextAddLines(context, addLines, count);
        CGContextStrokePath(context);
        if (!isWrongColor) {
            UIButton *currentBtn = [arrSelectedBtnArray lastObject];
            CGContextMoveToPoint(context, currentBtn.center.x, currentBtn.center.y);
            CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
            CGContextStrokePath(context);
        }
    }
}

#pragma -mark 显示错误
- (void)showErrorCircles:(NSString*)string{
    NSLog(@"show error");
    isWrongColor = YES;
    NSMutableArray *numbers = [[NSMutableArray alloc] initWithCapacity:string.length];
    for (int i = 0; i < string.length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSNumber *number = [NSNumber numberWithInt:[string substringWithRange:range].intValue - 1];
        [numbers addObject:number];
        [arrBtnArray[number.intValue] setSelected:YES];
        [arrSelectedBtnArray addObject:arrBtnArray[number.intValue]];
    }
    for (UIButton *aBtn in arrBtnArray) {
        if (aBtn.isSelected) {
            [aBtn setBackgroundImage:[UIImage imageNamed:@"circle_wrong"] forState:UIControlStateSelected];
        }
    }
    [self setNeedsDisplay];
    timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(showErrorCircles:)
                                           userInfo:nil
                                            repeats:NO];
    
}

@end
