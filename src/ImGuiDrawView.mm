#import "ImGuiDrawView.h"
#import "imgui.h"

@implementation ImGuiDrawView {
    bool showMenu;
    bool showFloatingButton;
    float gameSpeed;
    char searchBuffer[128];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        showMenu = true;
        showFloatingButton = true;
        gameSpeed = 1.0f;
        memset(searchBuffer, 0, sizeof(searchBuffer));
    }
    return self;
}

- (void)drawView {
    // 1. Botão Flutuante com a Engrenagem (⚙️) IDÊNTICO ao iGameGod
    if (showFloatingButton && !showMenu) {
        ImGui::SetNextWindowPos(ImVec2(30, 100), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowSize(ImVec2(50, 50), ImGuiCond_FirstUseEver);
        
        ImGuiWindowFlags floatFlags = ImGuiWindowFlags_NoDecoration | 
                                      ImGuiWindowFlags_NoResize | 
                                      ImGuiWindowFlags_NoSavedSettings | 
                                      ImGuiWindowFlags_NoFocusOnAppearing;
                                      
        // Estilo escuro translúcido para o botão flutuante
        ImGui::PushStyleColor(ImGuiCol_WindowBg, ImVec4(0.1f, 0.1f, 0.1f, 0.75f));
        if (ImGui::Begin("##FloatingGearButton", nil, floatFlags)) {
            // Botão com o emoji da engrenagem centralizado
            if (ImGui::Button("⚙️", ImVec2(40, 40))) {
                showMenu = true;
            }
        }
        ImGui::End();
        ImGui::PopStyleColor();
    }

    // 2. Janela Principal do Mod Menu (Estilo Painel iGameGod)
    if (showMenu) {
        ImGui::SetNextWindowSize(ImVec2(380, 300), ImGuiCond_FirstUseEver);
        
        if (ImGui::Begin("iGameGod", &showMenu, ImGuiWindowFlags_NoCollapse)) {
            
            // Abas Superiores
            if (ImGui::BeginTabBar("iGGTabs")) {
                
                // --- ABA SPEEDHACK ---
                if (ImGui::BeginTabItem("Speedhack")) {
                    ImGui::Spacing();
                    ImGui::Text("Game Speed Control");
                    ImGui::Separator();
                    
                    ImGui::SliderFloat("Speed", &gameSpeed, 0.1f, 20.0f, "%.1fx");
                    
                    if (ImGui::Button("Normal (1.0x)", ImVec2(130, 30))) {
                        gameSpeed = 1.0f;
                    }
                    
                    ImGui::EndTabItem();
                }
                
                // --- ABA BUSCA (SEARCH) ---
                if (ImGui::BeginTabItem("Search")) {
                    ImGui::Spacing();
                    ImGui::Text("Memory Finder");
                    ImGui::Separator();
                    
                    ImGui::Text("Value:");
                    ImGui::InputText("##searchinput", searchBuffer, sizeof(searchBuffer));
                    
                    if (ImGui::Button("Search", ImVec2(110, 30))) {
                        // Ação de busca
                    }
                    ImGui::SameLine();
                    if (ImGui::Button("Modify", ImVec2(110, 30))) {
                        // Ação de modificar
                    }
                    
                    ImGui::EndTabItem();
                }
                
                // --- ABA CONFIGURAÇÕES / MINIMIZAR ---
                if (ImGui::BeginTabItem("Settings")) {
                    ImGui::Spacing();
                    ImGui::Text("Tweak Options");
                    ImGui::Separator();
                    
                    if (ImGui::Button("Hide Menu (Show Gear)", ImVec2(180, 35))) {
                        showMenu = false; // Fecha o painel e ativa o botão da engrenagem na tela
                    }
                    
                    ImGui::Spacing();
                    ImGui::TextColored(ImVec4(0.0f, 0.8f, 1.0f, 1.0f), "Status: Running (Metal)");
                    
                    ImGui::EndTabItem();
                }
                
                ImGui::EndTabBar();
            }
        }
        ImGui::End();
    }
}

@end
