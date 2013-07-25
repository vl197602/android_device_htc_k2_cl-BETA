# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# common msm8960 configs
$(call inherit-product, device/htc/s4-common/s4.mk)

# Inherit qcom proprietary blobs
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/k2_cl/overlay

# Boot ramdisk setup
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc \
    remount.qcom

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
    device/htc/k2_cl/rootdir/etc/fstab.qcom:recovery/root/fstab.qcom

# Vold
PRODUCT_COPY_FILES += device/htc/k2_cl/configs/vold.fstab:system/etc/vold.fstab

# NFC
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# Build extra non-CM packages
PRODUCT_PACKAGES += \
    Torch

# BT
PRODUCT_PACKAGES += \
    libbt-vendor

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Fix bad lunch inheritance
PRODUCT_NAME := full_k2_cl

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/k2_cl/k2_cl-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Set build fingerprint / ID / Product Name ect.
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_k2_cl BUILD_FINGERPRINT=boost/htc/k2cl:4.1.2/JZO54K/573038:user/user-debug PRIVATE_BUILD_DESC="4.1.2 JZO54K 573038 user-debug"
