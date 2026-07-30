#import "ImGuiDrawView.h"
#include "ImGui/imgui.h"

@implementation ImGuiDrawView

- (void)drawView {
    // Configurações visuais iniciais do menu flutuante
    ImGui::Begin("Meu Mod Menu iOS", &isMenuOpen, ImGuiWindowFlags_AlwaysAutoResize);
    
    // Elementos visuais interativos
    ImGui::Text("Bem-vindo ao seu Mod Menu!");
    ImGui::Separator();
    
    static bool recursoAtivo = false;
    if (ImGui::Checkbox("Ativar Super Função", &recursoAtivo)) {
        // Ação executada quando o botão for alterado
    }
    
    ImGui::Spacing();
    ImGui::Text("FPS: %.1f", ImGui::GetIO().Framerate);
    
    ImGui::End();
}

@end
