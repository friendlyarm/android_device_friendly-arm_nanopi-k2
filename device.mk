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

# kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/friendly-arm/nanopi-k2-kernel/Image
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):boot/Image \
    device/friendly-arm/nanopi-k2-kernel/nanopi-k2.dtb:boot/nanopi-k2.dtb \
    $(LOCAL_PATH)/boot/logo.bmp:boot/logo.bmp \
    $(LOCAL_PATH)/boot/partmap.txt:partmap.txt \
    $(LOCAL_PATH)/boot/u-boot.bin:u-boot.bin

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/init.recovery.nanopi-k2.rc:root/init.recovery.nanopi-k2.rc

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.rc:root/init.rc \
    $(LOCAL_PATH)/init.nanopi-k2.rc:root/init.nanopi-k2.rc \
    $(LOCAL_PATH)/init.nanopi-k2.board.rc:root/init.nanopi-k2.board.rc \
    $(LOCAL_PATH)/init.nanopi-k2.usb.rc:root/init.nanopi-k2.usb.rc \
    $(LOCAL_PATH)/fstab.nanopi-k2:root/fstab.nanopi-k2 \
    $(LOCAL_PATH)/fstab.nanopi-k2.emmc:root/fstab.nanopi-k2.emmc \
    $(LOCAL_PATH)/ueventd.nanopi-k2.rc:root/ueventd.nanopi-k2.rc
    $(LOCAL_PATH)/nanopi-k2.rc:root/nanopi-k2.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/files/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/files/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/files/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/files/allowbackgroundapp.list:system/etc/allowbackgroundapp.list \
    $(LOCAL_PATH)/files/mesondisplay.cfg:system/etc/mesondisplay.cfg

# remote IME config file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/remote.conf:system/etc/remote.conf \
    $(LOCAL_PATH)/files/Vendor_0001_Product_0001.kl:/system/usr/keylayout/Vendor_0001_Product_0001.kl

# media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Screen size is "normal", density is "hdpi"
PRODUCT_AAPT_CONFIG := normal large xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_CHARACTERISTICS := tablet,usbstorage

DEVICE_PACKAGE_OVERLAYS := \
    $(LOCAL_PATH)/overlay

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# Set device insecure for all builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0

# set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/friendly-arm/nanopi-k2/device-nanopi-k2.mk)
$(call inherit-product-if-exists, vendor/friendly-arm/apps/device-partial.mk)

# google gms
$(call inherit-product-if-exists, vendor/google/gapps/device-partial.mk)

