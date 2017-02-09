# Inherit device configuration
$(call inherit-product, device/leeco/x3/device_x3.mk)

# Inherit some common OwnROM stuff.
$(call inherit-product, vendor/ownrom/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := x3
PRODUCT_NAME := ownrom_x3


