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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8960 configs
$(call inherit-product, device/htc/s4-common/s4.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/k2_cl/overlay

# Boot ramdisk setup
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc \
    remount.qcom

# vold config
PRODUCT_COPY_FILES += \
    device/htc/k2_cl/configs/vold.fstab:system/etc/vold.fstab

# wifi config
PRODUCT_COPY_FILES += \
    device/htc/k2_cl/configs/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    device/htc/k2_cl/firmware/fw_bcm4334.bin:/system/etc/firmware/fw_bcm4334.bin \
    device/htc/k2_cl/firmware/fw_bcm4334_apsta.bin:/system/etc/firmware/fw_bcm4334_apsta.bin \
    device/htc/k2_cl/firmware/fw_bcm4334_p2p.bin:/system/etc/firmware/fw_bcm4334_p2p.bin \
    device/htc/k2_cl/firmware/BCM4334B0_002.001.013.0488.0604.hcd:/system/etc/firmware/BCM4334B0_002.001.013.0488.0604.hcd

# Sound configs
PRODUCT_COPY_FILES += \
    device/htc/k2_cl/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/k2_cl/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/k2_cl/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/k2_cl/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/k2_cl/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/k2_cl/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/k2_cl/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg

PRODUCT_COPY_FILES += \
    device/htc/k2_cl/dsp/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/htc/k2_cl/dsp/snd_soc_msm/snd_soc_msm_Sitar:/system/etc/snd_soc_msm/snd_soc_msm_Sitar

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    device/htc/k2_cl/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/k2_cl/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/k2_cl/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/htc/k2_cl/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/k2_cl/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/k2_cl/idc/projector_input.idc:system/usr/idc/projector_input.idc

# Recovery
PRODUCT_COPY_FILES += \
    device/htc/fireball/rootdir/etc/fstab.qcom:recovery/root/fstab.qcom

# NFC
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Torch
PRODUCT_PACKAGES += \
    Torch

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/k2_cl/k2_cl-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := k2_cl
PRODUCT_NAME := k2_cl
PRODUCT_BRAND := htc
PRODUCT_MODEL := One SV
PRODUCT_MANUFACTURER := HTC
