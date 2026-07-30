#import <UIKit/UIKit.h>
#import "ImGuiDrawView.h"

static ImGuiDrawView *menuView = nil;

__attribute__((constructor))
static void initialize() {
    // Executa assim que o binário é carregado
    dispatch_async(dispatch_get_main_queue(), ^{
        // Fica checando a janela ativa a cada 1 segundo até o jogo carregar a interface gráfica
        __block __weak id observer = [[NSNotificationCenter defaultCenter] addObserverForName:UIWindowDidBecomeKeyNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
            UIWindow *window = note.object;
            if (window && !menuView) {
                menuView = [[ImGuiDrawView alloc] initWithFrame:window.bounds];
                menuView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
                [window addSubview:menuView];
                [window bringSubviewToFront:menuView];
            }
        }];
        
        // Tentativa imediata caso a janela já exista
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
