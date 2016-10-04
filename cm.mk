# Release name
PRODUCT_RELEASE_NAME := x3

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/leeco/x3/device_x3.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := x3
PRODUCT_NAME := cm_x3
PRODUCT_BRAND := leeco
PRODUCT_MODEL := x3
PRODUCT_MANUFACTURER := leeco
