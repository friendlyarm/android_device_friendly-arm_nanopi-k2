# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for nanopi-k2 hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

PRIV_DEVICE_PATH := device/friendly-arm/nanopi-k2

# Launcher, Camera and Gallery
ifeq ($(BOARD_USES_LAUNCHER3),true)
PRODUCT_PACKAGES += \
    Launcher3
endif

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni

PRODUCT_PROPERTY_OVERRIDES := \
    net.dns1=8.8.8.8 \
    net.dns2=8.8.4.4

# Inherit from the common Open Source product configuration
$(call inherit-product, build/target/product/aosp_base.mk)

PRODUCT_NAME := nanopi_k2
PRODUCT_DEVICE := nanopi-k2
PRODUCT_BRAND := Android
PRODUCT_MODEL := NanoPi-K2 (S905)
PRODUCT_MANUFACTURER := FriendlyARM (www.arm9.net)

# Amlogic specific features
TARGET_BUILD_CTS  := false
BOARD_USES_USB_PM := true
BUILD_WITH_LOWMEM_COMMON_CONFIG := true
WITH_LIBPLAYER_MODULE := false

# LOCAL_BOOTVIDEO := mbox.mp4
# LOCAL_WALLPAPER := default_wallpaper.png
BOARD_HAL_NAME := $(PRODUCT_DEVICE)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, $(LOCAL_PATH)/base/amlogic.mk)
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# gralloc
PRODUCT_PROPERTY_OVERRIDES += \
    sys.fb.bits=32

# hwcomposer
BOARD_USES_CURSOR_LAYER := false

BOARD_ALSA_AUDIO := tiny
$(call inherit-product, $(LOCAL_PATH)/base/audio.mk)

# wifi
MULTI_WIFI_SUPPORT := false
WIFI_MODULE := ap6212-ampak
$(call inherit-product, $(LOCAL_PATH)/base/wifi.mk)
$(call inherit-product-if-exists, vendor/broadcom/nanopi-k2/device-partial.mk)

# Change this to match target country
# 11 North America; 14 Japan; 13 rest of world
PRODUCT_DEFAULT_WIFI_CHANNELS := 11

$(call inherit-product, $(LOCAL_PATH)/base/drm.mk)
$(call inherit-product, $(LOCAL_PATH)/base/media.mk)
$(call inherit-product, $(LOCAL_PATH)/base/software.mk)

BUILD_WITH_PPPOE := true
$(call inherit-product, $(LOCAL_PATH)/base/pppoe.mk)

