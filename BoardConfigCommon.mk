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

USE_CAMERA_STUB := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := clovertrail

TARGET_BOARD_KERNEL_HEADERS := device/samsung/p5200/kernel-headers
TARGET_SPECIFIC_HEADER_PATH := device/samsung/p5200/include

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := x86-atom
TARGET_CPU_ABI := x86
TARGET_CPU_SMP := true

TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
BOARD_KERNEL_IMAGE_NAME := bzImage

# Use dlmalloc
MALLOC_IMPL := dlmalloc

#? BOARD_NAND_PAGE_SIZE := 4096
#? BOARD_NAND_SPARE_SIZE := 128
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x10000000
# BOARD_KERNEL_CMDLINE :=

# Init
TARGET_PROVIDES_INIT := true
TARGET_PROVIDES_INIT_TARGET_RC := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2474639360
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12654198784 # 12654215168 - 16384
BOARD_CACHEIMAGE_PARTITION_SIZE := 367001600
BOARD_FLASH_BLOCK_SIZE := 131072

# Use samsung specific code
BOARD_VENDOR := samsung

# Egl
BOARD_EGL_CFG := device/samsung/p5200/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_DISABLE_CURSOR_LAYER := true

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.opengles.version = 131072 \
    ro.hwui.text_large_cache_width = 2048 \
    ro.hwui.text_large_cache_height = 512 \
    ro.hwui.texture_cache_size = 24.0

# OMX
ENABLE_IMG_GRAPHICS := true
INTEL_VA := true
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USES_MRST_OMX := true
USE_INTEL_SECURE_AVC := true

# Vold
#? BOARD_VOLD_MAX_PARTITIONS := 12
#? BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#? BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
#? TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/f_mass_storage/lun%d/file"

# Wifi
BOARD_WLAN_DEVICE                := bcmdhd
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
BOARD_HAVE_SAMSUNG_WIFI          := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/p5200/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/p5200/bluetooth/vnd_santos10.txt

# Houdini
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST_32_BIT := x86 armeabi-v7a armeabi
BUILD_ARM_FOR_X86 := true

# Sensors
#? BOARD_USE_LEGACY_SENSORS_FUSION := false

# Security
#? BOARD_USES_SECURE_SERVICES := true

# Selinux
##BOARD_SEPOLICY_DIRS += \
##    device/samsung/p5200/selinux

##BOARD_SEPOLICY_UNION += \
##    file_contexts \
##    file.te \
##    device.te \
##    dock_kbd_attach.te \
##    domain.te \
##    geomagneticd.te \
##    init.te \
##    orientationd.te \
##    pvrsrvinit.te \
##    rild.te \
##    smc_pa.te \
##    wpa_supplicant.te

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun/file"
#? BOARD_USES_MMCUTILS := true
#? BOARD_HAS_NO_MISC_PARTITION := true
#? BOARD_HAS_NO_SELECT_BUTTON := true
#? BOARD_SUPPRESS_EMMC_WIPE := true
TARGET_RECOVERY_FSTAB := device/samsung/p5200/rootdir/fstab.santos10

# TWRP
DEVICE_RESOLUTION := 1280x800
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_CRYPTO := true

# Charging mode
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.santos10

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Use the non-open-source parts, if they're present
-include vendor/samsung/p52xx/BoardConfigVendor.mk
