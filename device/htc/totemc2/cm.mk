## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := totemc2

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/totemc2/device_totemc2.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := totemc2
PRODUCT_NAME := cm_totemc2
PRODUCT_BRAND := htc
PRODUCT_MODEL := totemc2
PRODUCT_MANUFACTURER := htc
