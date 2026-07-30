TARGET := iphone:clang:latest:14.0
ARCHS := arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := MeuModMenu

MeuModMenu_FILES = src/main.cpp \
                  src/ImGuiDrawView.mm \
                  src/ImGui/imgui.cpp \
                  src/ImGui/imgui_draw.cpp \
                  src/ImGui/imgui_tables.cpp \
                  src/ImGui/imgui_widgets.cpp \
                  src/ImGui/imgui_demo.cpp \
                  src/ImGui/backends/imgui_impl_metal.mm

MeuModMenu_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Isrc
MeuModMenu_LIBRARIES = substrate

# Frameworks gráficas do iOS necessárias para a ImGui funcionar com Metal
MeuModMenu_FRAMEWORKS = UIKit Foundation Metal QuartzCore CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk
