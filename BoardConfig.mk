#
# Copyright (C) 2013 Simon Sickle <simon@simonsickle.com>
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from S4 common
-include device/htc/s4-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := k2_cl

# Recovery
TARGET_RECOVERY_FSTAB := device/htc/k2_cl/ramdisk/fstab.k2_cl
RECOVERY_FSTAB_VERSION := 2

# Kernel
#BOARD_KERNEL_BASE := 0x80400000
#BOARD_KERNEL_PAGE_SIZE := 2048
#BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x81808000
TARGET_PREBUILT_KERNEL := device/htc/k2_cl/prebuilt/kernel
BUILD_KERNEL := false
TARGET_KERNEL_CONFIG := k2_cl_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/k2

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/k2_cl/bluetooth

# Use libril in the device tree
BOARD_PROVIDES_LIBRIL := true

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# QCOM GPS
#BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := k2_cl

# Lights
#TARGET_PROVIDES_LIBLIGHTS := true

# Wifi related defines
WIFI_BAND                        := 802_11_ABG
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4334.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/firmware/fw_bcm4334_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p22: 000ffa00 00000200 "misc"
#mmcblk0p21: 00fffe00 00000200 "recovery"
#mmcblk0p20: 01000000 00000200 "boot"
#mmcblk0p35: 54fffc00 00000200 "system"
#mmcblk0p29: 00140200 00000200 "local"
#mmcblk0p36: 0dfffe00 00000200 "cache"
#mmcblk0p37: 49fffe00 00000200 "userdata"
#mmcblk0p25: 01400000 00000200 "devlog"
#mmcblk0p27: 00040000 00000200 "pdata"
#mmcblk0p38: 1097fe000 00000200 "fat"
#mmcblk0p30: 00010000 00000200 "extra"
#mmcblk0p32: 01900000 00000200 "carrier"
#mmcblk0p16: 02d00000 00000200 "radio"
#mmcblk0p17: 00a00000 00000200 "adsp"
#mmcblk0p15: 00100000 00000200 "dsps"
#mmcblk0p18: 00500000 00000200 "wcnss"
#mmcblk0p19: 007ffa00 00000200 "radio_config"
#mmcblk0p23: 00400000 00000200 "modem_st1"
#mmcblk0p24: 00400000 00000200 "modem_st2"
#mmcblk0p31: 00040000 00000200 "skylink"
#mmcblk0p33: 00100000 00000200 "cdma_record"

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1426062336
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1241513472
BOARD_FLASH_BLOCK_SIZE := 512

# Vold
BOARD_VOLD_MAX_PARTITIONS := 38
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Use power button as select in recovery
BOARD_HAS_NO_SELECT_BUTTON := true

# Recovery
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/k2_cl/recovery/kernel
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
