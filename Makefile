TARGET := iphone:clang:latest:14.0
ARCHS := arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME := MeuModMenu

MeuModMenu_FILES = src/main.mm \
                  src/ImGuiDrawView.mm \
                  src/ImGui/imgui.cpp \
                  src/ImGui/imgui_draw.cpp \
                  src/ImGui/imgui_tables.cpp \
                  src/ImGui/imgui_widgets.cpp \
                  src/ImGui/backends/imgui_impl_metal.mm


MeuModMenu_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Isrc -Isrc/ImGui
MeuModMenu_LIBRARIES = substrate

MeuModMenu_FRAMEWORKS = UIKit Foundation Metal QuartzCore CoreGraphics

include $(THEOS_MAKE_PATH)/tweak.mk
