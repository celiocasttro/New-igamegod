#include <mach-o/dyld.h>
#include <stdint.h>
#include <unistd.h>
#include <pthread.h>

// Função para calcular o endereço real lidando com a ASLR
uint64_t getRealOffset(uint64_t offset) {
    uint64_t slide = _dyld_get_image_vmaddr_slide(0);
    return slide + offset;
}

// Exemplo de ponteiro para a função original do jogo
int (*orig_gameFunction)(void *self);

// Sua função modificada (Hook)
int hooked_gameFunction(void *self) {
    // Aqui você pode alterar valores ou controlar com o menu
    return orig_gameFunction(self);
}

// Função de inicialização executada automaticamente ao injetar o dylib
void *init_mod(void *) {
    // Aguarda o jogo carregar completamente os módulos principais
    sleep(2); 

    // Substitua 0xSEU_OFFSET pelo offset real da função que você quer modificar
    uint64_t meuOffsetFixo = 0x123456; 
    void *targetAddress = (void *)getRealOffset(meuOffsetFixo);

    // DobbyHook ou MSHookFunction para aplicar o gancho com segurança
    // (Certifique-se de importar a biblioteca de hooking escolhida no Makefile)
    
    return NULL;
}

__attribute__((constructor)) void entry() {
    pthread_t thread;
    pthread_create(&thread, NULL, init_mod, NULL);
}
