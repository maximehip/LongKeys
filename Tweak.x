#import <UIKit/UIKit.h>

@interface UIKeyboardImpl : UIView
-(void)insertText:(id)arg1;
-(UIResponder *)inputDelegate;
+(id)sharedInstance;
@end

@interface UIKBTree : NSObject
@property (nonatomic,retain) NSString * effectiveLayoutTag;
-(id)displayString;
@end

@interface UIKeyboardLayout : UIView
@end

@interface UIKeyboardLayoutStar : UIKeyboardLayout
@property (assign,nonatomic) BOOL repeatKeys;
-(UIKBTree *)activeKey;
-(void)longPressAction;
-(BOOL)didLongPress;
@end

%hook UIKeyboardLayoutStar
%property (assign,nonatomic) BOOL repeatKeys;

-(void)touchesMoved:(id)arg1 withEvent:(id)arg2 {
	if (self.repeatKeys == true) {
		UIKBTree *key = [self activeKey];
		if ([[key displayString] length] == 2) {
			[[UIKeyboardImpl sharedInstance] insertText:[key displayString]];
		}
	}
	%orig;
}

-(void)touchesEnded:(id)arg1 withEvent:(id)arg2 {
	self.repeatKeys = false;
	%orig;
}

-(void)touchesCancelled:(id)arg1 withEvent:(id)arg2 {
	self.repeatKeys = false;
	%orig;
}


-(void)longPressAction {

	self.repeatKeys = true;
	%orig;
}

%end