$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product, device/leeco/x3/device.mk)
$(call inherit-product-if-exists, vendor/leeco/x3/x3-vendor.mk)
$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_x3
PRODUCT_DEVICE := x3
PRODUCT_BRAND := LeEco
PRODUCT_MODEL := 乐1S
PRODUCT_MANUFACTURER := LeEco

# Release name
PRODUCT_RELEASE_NAME := LeEco Le 1S

# Boot animation
TARGET_SCREEN_HEIGHT      := 1920
TARGET_SCREEN_WIDTH       := 1080
TARGET_BOOTANIMATION_NAME := 1080

# LANGUAGE
PRODUCT_DEFAULT_LANGUAGE := zh
PRODUCT_DEFAULT_REGION   := CN

