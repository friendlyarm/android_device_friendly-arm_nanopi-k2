#
# Copyright (C) 2012 The Android Open Source Project
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

ifeq ($(WIFI_MODULE),ap6212-ampak)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd_ampak
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd_ampak

WIFI_DRIVER                 := AP6212
WIFI_DRIVER_MODULE_PATH     := /system/lib/modules/dhd.ko
WIFI_DRIVER_MODULE_NAME     := dhd
WIFI_DRIVER_MODULE_ARG      := \
    "firmware_path=/vendor/firmware/fw_bcm43438a0.bin nvram_path=/vendor/firmware/nvram_ap6212.txt"

WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := /vendor/firmware/fw_bcm43438a0.bin
WIFI_DRIVER_FW_PATH_AP      := /vendor/firmware/fw_bcm43438a0_apsta.bin
WIFI_DRIVER_FW_PATH_P2P     := /vendor/firmware/fw_bcm43438a0_p2p.bin
endif

ifeq ($(WIFI_MODULE),ap6212-bcm)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcm43438a0.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcm43438a0_apsta.bin"
endif

ifeq ($(WIFI_DRIVER_P2P_IF),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml
endif

ifeq ($(BOARD_WLAN_DEVICE),bcmdhd)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)
endif

# Product Property
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

