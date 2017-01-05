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

TARGET_BOARD_INFO_FILE := device/friendly-arm/nanopi-k2/board-info.txt

TARGET_BOARD_PLATFORM  := gxbaby
TARGET_BOOTLOADER_BOARD_NAME := nanopi-k2

TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP  := true
TARGET_ARCH     := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT  := cortex-a9
TARGET_USES_64_BIT_BINDER  := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL     := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_IS_2ND := false

TARGET_PROVIDES_INIT_RC  := true

# boot
BOARD_KERNEL_BASE    := 0x0
BOARD_KERNEL_OFFSET  := 0x01080000
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET)

# recovery
TARGET_RELEASETOOLS_EXTENSIONS  := device/friendly-arm/nanopi-k2

# certificate
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/friendly-arm/nanopi-k2/security/releasekey

# opengl
USE_OPENGL_RENDERER := true
IGN_EGL_BUFFERCOUNT := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

USING_MALI450   := true
USING_ION       := true
GPU_TARGET_PLATFORM := default_8a

# audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO    := true

# camera
USE_CAMERA_STUB := false
BOARD_HAVE_FRONT_CAM     := false
BOARD_HAVE_BACK_CAM      := false
BOARD_USE_USB_CAMERA     := true
IS_CAM_NONBLOCK          := true
BOARD_HAVE_FLASHLIGHT    := false
BOARD_HAVE_HW_JPEGENC    := true

# Bluetooth
BOARD_HAVE_BLUETOOTH     := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/friendly-arm/nanopi-k2/bluetooth

BOARD_HAL_STATIC_LIBRARIES  := libhealthd.mboxdefault
BOARD_HAS_RIL   := false
MALLOC_IMPL     := dlmalloc

# sepolicy
include device/friendly-arm/nanopi-k2/base/sepolicy.mk

# Enable dex pre-opt to speed up initial boot
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
    WITH_DEXPREOPT_PIC := true
    ifneq ($(TARGET_BUILD_VARIANT),user)
      # Retain classes.dex in APK's for non-user builds
      DEX_PREOPT_DEFAULT := nostripping
    endif
  endif
endif

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE     := 74448896   #  71MB
BOARD_BOOTIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 803209216  # 766MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2483027968 # 2.3GB
BOARD_CACHEIMAGE_PARTITION_SIZE    := 484442112  # 462MB
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

