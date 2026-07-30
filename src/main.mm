#import <UIKit/UIKit.h>
#import "ImGuiDrawView.h"

static ImGuiDrawView *menuView = nil;

__attribute__((constructor))
static void initialize() {
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            if (keyWindow && !menuView) {
                menuView = [[ImGuiDrawView alloc] initWithFrame:keyWindow.bounds];
                menuView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
                [keyWindow addSubview:menuView];
                [keyWindow bringSubviewToFront:menuView];
            }
        });
    });
}
