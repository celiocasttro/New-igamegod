#import <UIKit/UIKit.h>
#import "ImGuiDrawView.h"

static ImGuiDrawView *menuView = nil;

__attribute__((constructor))
static void initialize() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *targetWindow = nil;
        
        for (UIWindow *window in [UIApplication sharedApplication].windows) {
            if (window.rootViewController != nil) {
                targetWindow = window;
                break;
            }
        }
        
        if (!targetWindow) {
            targetWindow = [UIApplication sharedApplication].keyWindow;
        }
        
        if (targetWindow && !menuView) {
            menuView = [[ImGuiDrawView alloc] initWithFrame:targetWindow.bounds];
            [targetWindow addSubview:menuView];
            [targetWindow bringSubviewToFront:targetWindow.subviews.lastObject];
        }
    });
}
