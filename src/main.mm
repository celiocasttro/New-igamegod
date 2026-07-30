#import <UIKit/UIKit.h>

// Esta função roda automaticamente assim que o Dylib é carregado pelo jogo
__attribute__((constructor))
static void initialize() {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Mod Menu"
                                                                      message:@"Injetado com sucesso!"
                                                               preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" 
                                                           style:UIAlertActionStyleDefault 
                                                         handler:nil];
        [alert addAction:okAction];

        // Obtém a janela ativa do app para exibir o alerta
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
        [keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });
}
