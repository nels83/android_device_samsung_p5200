#
# Copyright (C) 2012 The CyanogenMod Project
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

DEVICE_PACKAGE_OVERLAYS += device/samsung/p5200/common-overlay

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

LOCAL_PATH := device/samsung/p5200

# Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=96m \

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.isUsbOtgEnabled=true

#? PRODUCT_PROPERTY_OVERRIDES += \
#?     panel.physicalWidthmm = 217 \
#?     panel.physicalHeightmm = 136 \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.xml:system/etc/gps.xml

PRODUCT_PACKAGES += \
    pvrsrvctl \
    libcorkscrew \
    libsecril-client

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Media profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml

# Camera profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera_profiles.xml:system/etc/camera_profiles.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usr/idc/sec_keyboard.idc:system/usr/idc/sec_keyboard.idc \
    $(LOCAL_PATH)/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(LOCAL_PATH)/usr/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Packages
PRODUCT_PACKAGES += \
    audio.primary.santos10 \
    audio.r_submix.default \
    audio.a2dp.default \
    audio.usb.default \
    camera.santos10 \
    consumerir.santos10 \
    lights.santos10 \
    power.clovertrail \
    sensors.santos10 \
    libwsbm

#?     libinvensense_mpl \
##    hwcomposer.clovertrail \

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Samsung dock keyboard
#? PRODUCT_PACKAGES += \
#?     dock_kbd_attach

# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    \
    libwrs_omxil_core_pvwrapped \
    \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoEncoderAVC \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4 \
    \
    libmixvbp \
    libmixvbp_h264 \
    libmixvbp_mpeg4 \
    libmixvbp_vc1

# Houdini
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.native.bridge=libhoudini.so

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.isa.arm=x86 \
    ro.enable.native.bridge.exec=1

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.santos10.rc:root/init.santos10.rc \
    $(LOCAL_PATH)/rootdir/fstab.santos10:root/fstab.santos10 \
    $(LOCAL_PATH)/rootdir/init.santos10.usb.rc:root/init.santos10.usb.rc \
    $(LOCAL_PATH)/rootdir/init.houdini.rc:root/init.houdini.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.santos10.rc:root/init.recovery.santos10.rc \
    $(LOCAL_PATH)/rootdir/twrp.fstab:recovery/root/etc/twrp.fstab

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product, vendor/samsung/p52xx/p52xx-vendor.mk)
