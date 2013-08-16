//
//  SpendifyUITableViewCell.m
//  ShoppingHelper
//
//  Created by Corey Schaf on 1/13/13.
//  Copyright (c) 2013 blaQk SHeep. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "SpendifyUITableViewCell.h"


@implementation SpendifyUITableViewCell{
    
    CAGradientLayer *_gradientLayer;
    CGPoint _originalCenter;
    BOOL _deleteOnDragRelease;
    BOOL _oppositeDeleteOnDragRelease;
    
    UILabel *_crossLabel;
    UILabel *_oppositeCrossLabel;
}

@synthesize delegate = _delegate;

const float UI_CUES_MARGIN = 10.0f;
const float UI_CUES_WIDTH = 50.0f;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _crossLabel = [self createCueLabel];
        _crossLabel.text = @"\u2717";
        _crossLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_crossLabel];
        
        // add tick and cross
        _oppositeCrossLabel = [self createCueLabel];
        _oppositeCrossLabel.text = @"\u2717";
        _oppositeCrossLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_oppositeCrossLabel];

        
        //add a layer that overlays teh cell adding a subtle gradient effect
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = self.bounds;
        _gradientLayer.colors = @[(id)[[UIColor colorWithWhite:1.0f alpha:0.2f] CGColor],
        (id)[[UIColor colorWithWhite:1.0f alpha:0.1f] CGColor],
        (id)[[UIColor clearColor] CGColor],
        (id)[[UIColor colorWithWhite:0.0f alpha:0.1f] CGColor]];
        _gradientLayer.locations = @[@0.00f, @0.01f, @0.95f, @1.00f];
        
        [self.layer insertSublayer:_gradientLayer atIndex:0];
        
        // Add a pan gesture recognizer
        UIGestureRecognizer* recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        recognizer.delegate = self;
        [self addGestureRecognizer:recognizer];
        
    }
    return self;
}

// utility method for creating the contetual cues
-(UILabel*) createCueLabel{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectNull];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:32.0];
    label.backgroundColor = [UIColor clearColor];
    return label;
}

const float LABEL_LEFT_MARGIN = 15.0f;

-(void) layoutSubviews{
    [super layoutSubviews];
    
    // ensure the gradient layers occupies the full bounds
    _gradientLayer.frame = self.bounds;
    
    // contextual clues
    _crossLabel.frame = CGRectMake(self.bounds.size.width + UI_CUES_MARGIN, 0, UI_CUES_WIDTH, self.bounds.size.height);
    
    // context clues
    _oppositeCrossLabel.frame = CGRectMake(-UI_CUES_WIDTH - UI_CUES_MARGIN, 0,
                                  UI_CUES_WIDTH, self.bounds.size.height);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setItemData:(ItemData *)itemData{
    
    _itemData = itemData;
    // we must update all teh visual state associated with the model item
    
}

#pragma mark - horizontl pan gesture methods
-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer{
    CGPoint translation = [gestureRecognizer translationInView:[self superview]];
    
    // check for horizontal gesture
    if(fabsf(translation.x) > fabsf(translation.y)){
        return YES;
    }
    
    return NO;
}

-(void) handlePan:(UIPanGestureRecognizer *)recognizer{
    
    if(recognizer.state == UIGestureRecognizerStateBegan){
        // if the gesture has just started, record the current center
        _originalCenter = self.center;
    }
    
    if(recognizer.state == UIGestureRecognizerStateChanged){
        // translate the center
        CGPoint translation = [recognizer translationInView:self];
        self.center = CGPointMake(_originalCenter.x + translation.x, _originalCenter.y);
        
        // determine whether teh item has been dragged far enough to initiate a delete or  complete
        _deleteOnDragRelease = self.frame.origin.x < -self.frame.size.width / 2;
        
        _oppositeDeleteOnDragRelease = self.frame.origin.x > self.frame.size.width / 2;
        
        float cueAlpha = fabsf(self.frame.origin.x) / (self.frame.size.width / 2);
        _crossLabel.alpha = cueAlpha;
        _oppositeCrossLabel.alpha = cueAlpha;
        
        // indicate when the item have been pulled far enough to invoke the given action
        _crossLabel.textColor = _deleteOnDragRelease ? [UIColor redColor] : [UIColor whiteColor];
        _oppositeCrossLabel.textColor = _oppositeDeleteOnDragRelease ? [UIColor redColor] : [UIColor whiteColor];
    }
    
    if(recognizer.state == UIGestureRecognizerStateEnded){
        
        // the frame this cell would have had before being dragged
        CGRect originalFrame = CGRectMake(0, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
        
        if(!_deleteOnDragRelease || !_oppositeDeleteOnDragRelease){
            [UIView animateWithDuration:0.2 animations:^{
                self.frame = originalFrame;
            }];
        }
        
        if(_deleteOnDragRelease || _oppositeDeleteOnDragRelease){
            
            // notify the delegate that this item should be deleted
            [self.delegate priceItemDeleted:self.itemData];
        }
        
        
        
    }
    
}

@end
















