//
//  ReusableComponent.m
//  Component1
//
//  Created by CLPricingTeam on 12/29/14.
//  Copyright (c) 2014 Philips. All rights reserved.
//

#import "ReusableComponent.h"
#import "ReusableViewController.h"

#define   DEGREES_TO_RADIANS(degrees)  ((3.14 * degrees)/ 180)

@implementation ReusableComponent

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)createMaskLayer
{
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    self.subview.layer.mask = maskLayer;
    self.maskLayer = maskLayer;
    
    
}

-(void)createCircleShapeLayer
{
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.lineWidth = 1.0;
    circleLayer.fillColor = [[UIColor clearColor] CGColor];
    
    circleLayer.strokeColor = [[UIColor whiteColor] CGColor];
    
    [self.layer addSublayer:circleLayer];
    self.circleLayer = circleLayer;
}


-(void)createboundingCircleShapeLayer:(CGFloat) radius
{
    
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath addArcWithCenter:CGPointMake(384,502)
                          radius:radius
                      startAngle:0.0
                        endAngle:DEGREES_TO_RADIANS(360)
                       clockwise:YES];
    
    bezierPath.lineWidth = 1.0;
    [[UIColor clearColor] setStroke];
    [bezierPath closePath];
    [bezierPath stroke];
    borderCircle.path=[bezierPath CGPath];
    
    [self.layer addSublayer:borderCircle];
}


- (void)updateCirclePathAtLocation:(CGPoint)location radius:(CGFloat)radius
{
    self.circleCenter = location;
    self.circleRadius = radius;
    
    
    
    path = [UIBezierPath bezierPath];
    
    if (circlePressed)
    {
        
        [path addArcWithCenter:self.circleCenter
                        radius:self.circleRadius
                    startAngle:0.0
                      endAngle:DEGREES_TO_RADIANS(360)
                     clockwise:YES];

        
    }
    
    else
    {
        [path moveToPoint:CGPointMake(a, b)];
        [path addLineToPoint:CGPointMake(c, d)];
        [path addLineToPoint:CGPointMake(e, f)];
        [path addLineToPoint:CGPointMake(g, h)];
        [path addLineToPoint:CGPointMake(a, b)];

    }
    
    
    UIColor* white = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.374];
    [path setLineWidth:1.0];
    [white setStroke];
    
    
    self.circleLayer.path = [path CGPath];
    
    
        self.maskLayer.path = [path CGPath];
        
        
    
}


-(void)shareInstance:(ReusableViewController *)mainController
{
    [self createMaskLayer];
    [self createCircleShapeLayer];
   // [self createboundingCircleShapeLayer:self.bounds.size.width*0.30];
    a=300;
    b=150 ;
    c=300;
    d=610;
    e=760;
    f=610;
    g=760;
    h=150 ;
    squarePressed=YES;
    circlePressed=NO;
    
    [self updateCirclePathAtLocation:CGPointMake(530,380) radius:226.0];
    collinatorTouched=NO ;
    [self createCollinator];
}

-(void)createCollinator
{
    UIImage *image = [UIImage imageNamed:@"Collinator.png"];
    
    self.collinator = [[UIImageView alloc]initWithImage:image];
     self.collinator.center=CGPointMake(300,150);
    
    self.collinator.layer.borderWidth =1.0 ;
    self.collinator.layer.borderColor=[[UIColor grayColor]CGColor];
    self.collinator.layer.cornerRadius=5.0;
    
    self.collinator.layer.transform =CATransform3DMakeRotation(DEGREES_TO_RADIANS(-30), 0.0, 0.0, 1.0);
    
    [self addSubview:self.collinator];
    
    [self bringSubviewToFront:self.collinator];
    
    
}

-(CGFloat)slopeOFline:(CGPoint)p1 and:(CGPoint)p2
{
    CGFloat slope = (p2.y-p1.y)/(p2.x-p1.x);
    
    NSLog(@"SLOPE %f",slope);
    
    return slope ;
}

/** Calculates the distance between point1 and point2. */
CGFloat distanceBetweenPoints(CGPoint point1, CGPoint point2)
{
    CGFloat dx = point1.x - point2.x;
    CGFloat dy = point1.y - point2.y;
    return sqrt(dx*dx + dy*dy);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
     CGPoint nowPoint  = [[touches anyObject] locationInView: self];
    
    if (CGRectContainsPoint(self.collinator.frame, nowPoint))
    {
        collinatorTouched=YES ;
    }
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CGPoint nowPoint  = [[touches anyObject] locationInView: self];
    CGPoint previousPoint = [[touches anyObject] previousLocationInView:self];
    
    CGPoint centreOfCircle ;
    centreOfCircle.x =530.0;
    centreOfCircle.y =380.0;
    
    
    if (collinatorTouched)
    {
        self.circleLayer.strokeColor=[[UIColor colorWithRed:249/255.0 green:217/255.0 blue:143.0/255.0 alpha:1.0]CGColor];
        
        self.circleLayer.lineWidth=2.0;
        
        
        CGFloat xMove = nowPoint.x - previousPoint.x;
        CGFloat yMove = nowPoint.y - previousPoint.y;
        CGFloat distance = sqrt ((xMove * xMove) + (yMove * yMove));
         CGFloat newRadius=0.0;
        
        if (previousPoint.y<nowPoint.y)
        {
            if (squarePressed)
            {
                a=a+distance ;
                b=b+distance ;
                c=c+distance ;
                d=d-distance ; //y
                e=e-distance ; //x
                f=f-distance; //y
                g=g-distance ;//x
                h=h+distance ;

            }
            
            else
            {
                newRadius=self.circleRadius - distance ;
                
            }
            
        }
        
        else
        {
            if (squarePressed)
            {
                a=a-distance ;
                b=b-distance ;
                c=c-distance ;
                d=d+distance ; //y
                e=e+distance ; //x
                f=f+distance; //y
                g=g+distance ;//x
                h=h-distance ;

            }
            else
            {
                
                newRadius=self.circleRadius + distance ;

            }
           
            
        }
        
        if (a<300)
        {
            a=300;
            b=150 ;
            c=300;
            d=610;
            e=760;
            f=610;
            g=760;
            h=150 ;
            
        }
        
        else
        {
            CGFloat slope =[self slopeOFline:self.collinator.center and:centreOfCircle];
            
            CGPoint pointOnCircle ;
            CGPoint cornerofRect = CGPointMake(a, b);
            CGFloat radius=0.0;
            
            if (squarePressed)
            {
                radius =distanceBetweenPoints(cornerofRect,centreOfCircle);
            }
            
            else
            {
                  radius = newRadius+29 ;
                
            }
            
            
            NSLog(@"THE POINTS ARE %f %f",self.collinator.center.x,self.collinator.center.y);
            
            pointOnCircle.y = centreOfCircle.y+((slope*radius)/-sqrt(slope*slope +1))  ;
            
            pointOnCircle.x = centreOfCircle.x+((pointOnCircle.y - centreOfCircle.y)/slope) ;
            
            self.collinator.center=pointOnCircle ;
            
            NSLog(@"THE POINTS ARE %f %f",self.collinator.center.x,self.collinator.center.y);
        }

        
        [self updateCirclePathAtLocation:CGPointMake(530,380) radius:newRadius];
    }
    
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    collinatorTouched=NO;
    
    self.circleLayer.strokeColor=[[UIColor grayColor]CGColor];
    
    self.circleLayer.lineWidth=2.0;
    
}

-(IBAction)squareCollinatorPressed:(id)sender
{
    squarePressed=YES;
    circlePressed=NO ;
    
    a=300;
    b=150 ;
    c=300;
    d=610;
    e=760;
    f=610;
    g=760;
    h=150 ;
    
    [self updateCirclePathAtLocation:CGPointMake(530,380) radius:226.0];
    
    self.collinator.center=CGPointMake(300,150);

    
    
}


-(IBAction)circleCollinatorPressed:(id)sender
{
   
    circlePressed=YES ;
    squarePressed=NO ;
    
    [self updateCirclePathAtLocation:CGPointMake(530,380) radius:226.0];
    
    self.collinator.center=CGPointMake(380,180);

    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
