# Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := k2_cl

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/k2_cl/device_k2_cl.mk)

# Device naming
PRODUCT_DEVICE := k2_cl
PRODUCT_NAME := cm_k2_cl
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC One SV
PRODUCT_MANUFACTURER := HTC

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_k2_cl BUILD_FINGERPRINT=boost/htc/k2cl:4.3/JB_MR2/573038:user/user-debug PRIVATE_BUILD_DESC="k2_cl-user 4.3 JB_MR2 573038 user-debug"
