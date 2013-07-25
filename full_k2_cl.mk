# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/htc/k2_cl/device.mk)

ifneq ($(TARGET_BUILD_VARIANT),codefirex)
# Get the long list of APNs
PRODUCT_COPY_FILES := device/sample/etc/apns-full-conf.xml:system/etc/apns-conf.xml
else
# Specify phone tech before including full_phone
$(call inherit-product, vendor/cfx/config/cdma.mk)

# Copy Bootanimation
PRODUCT_COPY_FILES += \
    vendor/cfx/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip

# Inherit CFX stuff
$(call inherit-product, vendor/cfx/config/common_full_phone.mk)
endif

# Release Name
PRODUCT_RELEASE_NAME := One SV

PRODUCT_NAME := full_k2_cl
PRODUCT_DEVICE := k2_cl
PRODUCT_BRAND := htc_wwe
PRODUCT_MODEL := One SV
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_k2cl BUILD_FINGERPRINT=google/occam/mako:4.2.2/JDQ39E/573038:user/release-keys PRIVATE_BUILD_DESC="occam-user 4.2.2 JDQ39E 573038 release-keys"	

