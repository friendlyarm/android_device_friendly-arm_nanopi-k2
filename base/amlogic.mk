#
# Copyright (C) 2011 The Android Open-Source Project
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

$(call inherit-product, $(LOCAL_PATH)/core.mk)

PRODUCT_PACKAGES += \
    imageserver \
    busybox \
    utility_busybox

# DLNA
PRODUCT_PACKAGES += \
    DLNA

PRODUCT_PACKAGES += \
    remotecfg

USE_CUSTOM_AUDIO_POLICY := 1

# NativeImagePlayer
PRODUCT_PACKAGES += \
    NativeImagePlayer

# RemoteControl Service
PRODUCT_PACKAGES += \
    RC_Service

# Camera Hal
PRODUCT_PACKAGES += \
    camera.$(BOARD_HAL_NAME)

# HDMITX CEC HAL
PRODUCT_PACKAGES += \
    hdmi_cec.$(BOARD_HAL_NAME)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hdmi.device_type=4

# USB PM
PRODUCT_PACKAGES += \
    usbtestpm \
    usbpower

# device features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.software.backup.xml:system/etc/permissions/android.software.backup.xml \
    frameworks/native/data/etc/android.software.device_admin.xml:system/etc/permissions/android.software.device_admin.xml \
    frameworks/native/data/etc/android.software.managed_users.xml:system/etc/permissions/android.software.managed_users.xml \
    frameworks/native/data/etc/android.software.live_tv.xml:system/etc/permissions/android.software.live_tv.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml

# USB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# copy lowmem_manage.sh
PRODUCT_COPY_FILES += \
    $(PRIV_DEVICE_PATH)/lowmem/lowmem_manage.sh:system/bin/lowmem_manage.sh

# copy lowmemorykiller.txt
ifeq ($(BUILD_WITH_LOWMEM_COMMON_CONFIG),true)
PRODUCT_COPY_FILES += \
    $(PRIV_DEVICE_PATH)/lowmem/lowmemorykiller_2G.txt:system/etc/lowmemorykiller_2G.txt \
    $(PRIV_DEVICE_PATH)/lowmem/lowmemorykiller.txt:system/etc/lowmemorykiller.txt \
    $(PRIV_DEVICE_PATH)/lowmem/lowmemorykiller_512M.txt:system/etc/lowmemorykiller_512M.txt
endif

# copy .kl files
custom_keylayouts := $(wildcard $(PRIV_DEVICE_PATH)/keyboards/*.kl)
PRODUCT_COPY_FILES += $(foreach file,$(custom_keylayouts),\
    $(file):system/usr/keylayout/$(notdir $(file)))

# bootanimation
PRODUCT_COPY_FILES += \
    $(PRIV_DEVICE_PATH)/bootanimation.zip:system/media/bootanimation.zip

# bootvideo
BUILD_WITH_BOOT_PLAYER := true

PRODUCT_PACKAGES += \
    libasound \
    libamstreaming \
    bootplayer \
    alsalib-alsaconf \
    alsalib-pcmdefaultconf \
    alsalib-cardsaliasesconf

ifneq ($(LOCAL_BOOTVIDEO),)
PRODUCT_COPY_FILES += \
    $(PRIV_DEVICE_PATH)/$(LOCAL_BOOTVIDEO):system/etc/bootvideo
endif

# default wallpaper to fix bug 106225
ifneq ($(LOCAL_WALLPAPER),)
PRODUCT_COPY_FILES += \
    $(PRIV_DEVICE_PATH)/$(LOCAL_WALLPAPER):system/etc/default_wallpaper.png

ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.wallpaper=/system/etc/default_wallpaper.png
endif

# User builds only
DISPLAY_BUILD_NUMBER := true

