#import <UIKit/UIKit.h>
#import "ImGuiDrawView.h"

// Ponteiro para manter a view do menu viva na memória
static ImGuiDrawView *menuView = nil;

__attribute__((constructor))
static void initialize() {
    // Aguarda o app terminar de carregar a interface inicial
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *keyWindow = nil;
        
        // Pega a janela principal ativa de forma compatível com iOS moderno
        for (UIWindow *window in [UIApplication sharedApplication].windows) {
            if (window.isKeyWindow) {
                keyWindow = window;
                break;
            }
        }
        
        if (!keyWindow) {
            keyWindow = [UIApplication sharedApplication].keyWindow;
        }
        
        if (keyWindow && !menuView) {
            // Cria a view da ImGui cobrindo toda a tela do jogo
            menuView = [[ImGuiDrawView alloc] initWithFrame:keyWindow.bounds];
            [keyWindow addSubview:menuView];
            [keyWindow bringSubviewToFront:menuView];
        }
    });
}
