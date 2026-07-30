#include <mach-o/dyld.h>
#include <stdint.h>
#include <unistd.h>
#include <pthread.h>

// Função para calcular o endereço real lidando com a ASLR
uint64_t getRealOffset(uint64_t offset) {
    uint64_t slide = _dyld_get_image_vmaddr_slide(0);
    return slide + offset;
}

// Função de inicialização executada automaticamente ao injetar o dylib
void *init_mod(void *) {
    sleep(2); 

    // Exemplo de uso prático para evitar variáveis não utilizadas
    uint64_t meuOffsetFixo = 0x123456; 
    void *targetAddress = (void *)getRealOffset(meuOffsetFixo);
    
    // Evita aviso de variável não utilizada enquanto você não coloca o hook real
    (void)targetAddress; 
    
    return NULL;
}

__attribute__((constructor)) void entry() {
    pthread_t thread;
    pthread_create(&thread, NULL, init_mod, NULL);
}
