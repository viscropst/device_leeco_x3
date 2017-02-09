# 64-bit support
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Language
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Dalvik/HWUI
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Vendor
$(call inherit-product, vendor/leeco/x3/x3-vendor-blobs.mk)

# Overlay Folder
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/deps/overlay

# Folder path
LOCAL_PATH := device/leeco/x3

# Screen density
PRODUCT_AAPT_CONFIG := normal xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := x3,X500,X507,X509,X3,x500,x507,x509,X502,x502

# Power
PRODUCT_PACKAGES += \
    power.mt6795 \

# Camera
PRODUCT_PACKAGES += \
    Snap \

# Use CM Gello browser
PRODUCT_PACKAGES += \
    Gello \

# Audio
PRODUCT_PACKAGES += \
    audio_policy.default \
    audio_policy.stub \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix \
    libtinyalsa
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/deps/configs/audio/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/deps/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/deps/configs/audio/audio_em.xml:system/etc/audio_em.xml \
    $(LOCAL_PATH)/deps/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(LOCAL_PATH)/deps/configs/audio_param/AudioParamOptions.xml:system/etc/audio_param/AudioParamOptions.xml
#Codec
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/deps/configs/codec/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/deps/configs/codec/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
    $(LOCAL_PATH)/deps/configs/codec/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/deps/configs/codec/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/deps/configs/codec/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/deps/configs/codec/media_codecs.xml:system/etc/permissions/media_codecs.xml
# media	
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/deps/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/deps/configs/media/media_codecs.xml:system/etc/permissions/media_codecs.xml \
    $(LOCAL_PATH)/deps/configs/media/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml\
    $(LOCAL_PATH)/deps/configs/media/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/deps/configs/media/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/deps/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/deps/configs/mtk_clear_motion.cfg:system/etc/mtk_clear_motion.cfg

# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx \
    libwifi-hal-mt66xx \
    wifi_hal \
    libwpa_client \
    hostapd \
    hostapd_cli \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf    

# Bluetooth                            
PRODUCT_PACKAGES += \
    audio.a2dp.default 
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/deps/configs/bluetooth/auto_pair_blacklist.conf:system/etc/bluetooth/auto_pair_blacklist.conf \
    $(LOCAL_PATH)/deps/configs/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
    $(LOCAL_PATH)/deps/configs/bluetooth/btconfig.xml:system/etc/bluetooth/btconfig.xml \
    $(LOCAL_PATH)/deps/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
    $(LOCAL_PATH)/deps/configs/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf \
    $(LOCAL_PATH)/deps/configs/bluetooth/bt_stack.conf.debug:system/etc/bluetooth/bt_stack.conf.debug \
    $(LOCAL_PATH)/deps/configs/bluetooth/bt_stack.conf.sqc:system/etc/bluetooth/bt_stack.conf.sqc

# Keyboard layout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/deps/configs/keylayout/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
     $(LOCAL_PATH)/deps/configs/keylayout/ACCDET.kl:system/usr/keylayout/ACCDET.kl\
     $(LOCAL_PATH)/deps/configs/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl\
     $(LOCAL_PATH)/deps/configs/keylayout/synaptics_dsx_i2c.kl:system/usr/keylayout/synaptics_dsx_i2c.kl 

# Telecom
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/deps/configs/ril_config/apns-conf.xml:system/etc/apns-conf.xml \
    $(LOCAL_PATH)/deps/configs/ril_config/ecc_list.xml:system/etc/ecc_list.xml \
    $(LOCAL_PATH)/deps/configs/ril_config/spn-conf.xml:system/etc/spn-conf.xml 
# set Telephony property - SIM count
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/deps/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/deps/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/deps/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images \

# GPS
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/deps/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/deps/configs/.tp/.ht120.mtc:system/etc/.tp/.ht120.mtc \
     $(LOCAL_PATH)/deps/configs/.tp/thermal.conf:system/etc/.tp/thermal.conf \
     $(LOCAL_PATH)/deps/configs/.tp/thermal.off.conf:system/etc/.tp/thermal.off.conf \
     $(LOCAL_PATH)/deps/configs/.tp/.thermal_policy_00:system/etc/.tp/.thermal_policy_00 \
     $(LOCAL_PATH)/deps/configs/.tp/.thermal_policy_01:system/etc/.tp/.thermal_policy_01 

# FM Radio
PRODUCT_PACKAGES += \
     	FmRadio
# ANT+
PRODUCT_PACKAGES += \
	AntHalService \
	com.dsi.ant.antradio_library \
	antradio_app \
	ANT_RAM_CODE_E1.BIN \
	ANT_RAM_CODE_E2.BIN \
	libantradio

PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

# ANT Permissions
PRODUCT_COPY_FILES += \
	external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

# Ramdisk x3
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/deps/rootdir/enableswap.sh:root/enableswap.sh \
    $(LOCAL_PATH)/deps/rootdir/factory_init.project.rc:root/factory_init.project.rc \
    $(LOCAL_PATH)/deps/rootdir/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/deps/rootdir/fstab.mt6795:root/fstab.mt6795 \
    $(LOCAL_PATH)/deps/rootdir/init.aee.rc:root/init.aee.rc \
    $(LOCAL_PATH)/deps/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/deps/rootdir/init.mt6795.rc:root/init.mt6795.rc \
    $(LOCAL_PATH)/deps/rootdir/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
    $(LOCAL_PATH)/deps/rootdir/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/deps/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/deps/rootdir/init.xlog.rc:root/init.xlog.rc \
    $(LOCAL_PATH)/deps/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
    $(LOCAL_PATH)/deps/rootdir/meta_init.project.rc:root/meta_init.project.rc \
    $(LOCAL_PATH)/deps/rootdir/meta_init.rc:root/meta_init.rc \
    $(LOCAL_PATH)/deps/rootdir/ueventd.mt6795.rc:root/ueventd.mt6795.rc \
    $(LOCAL_PATH)/deps/rootdir/init.volte.rc:root/init.volte.rc \
    $(LOCAL_PATH)/deps/rootdir/init.mal.rc:root/init.mal.rc \
    

# Permissions
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/deps/configs/permissions/platform.xml:system/etc/permissions/platform.xml \
    $(LOCAL_PATH)/deps/configs/permissions/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    $(LOCAL_PATH)/deps/configs/permissions/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    $(LOCAL_PATH)/deps/configs/permissions/com.android.location.provider.xml:system/etc/permissions/com.android.location.provider.xml \
    $(LOCAL_PATH)/deps/configs/permissions/com.android.media.remotedisplay.xml:system/etc/permissions/com.android.media.remotedisplay.xml \
    $(LOCAL_PATH)/deps/configs/permissions/com.android.mediadrm.signer.xml:system/etc/permissions/com.android.mediadrm.signer.xml \
    $(LOCAL_PATH)/deps/configs/permissions/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
    $(LOCAL_PATH)/deps/configs/permissions/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
    $(LOCAL_PATH)/deps/configs/permissions/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \

# Torch
PRODUCT_PACKAGES += \
    Torch

# Var patch
ifneq ($(TARGET_BUILD_VARIANT),user)
  ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
  ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
endif
ifneq ($(TARGET_BUILD_VARIANT),userdebug)
  ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
  ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
endif
ifneq ($(TARGET_BUILD_VARIANT),eng)
  ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
  ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
endif
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
     ro.adb.secure=0 \
     ro.secure=1 \
     ro.allow.mock.location=0 \
     ro.debuggable=1 \
     ro.zygote=zygote64_32 \
     dalvik.vm.dex2oat-Xms=64m \
     dalvik.vm.dex2oat-Xmx=64m \
     dalvik.vm.image-dex2oat-Xms=64m \
     dalvik.vm.image-dex2oat-Xmx=512m \
     ro.dalvik.vm.native.bridge=0 \
     persist.sys.usb.config=mtp \
     ro.mount.fs=EXT4 \
     camera.disable_zsl_mode=1 \
     

#PRODUCT_PROPERTY_OVERRIDES
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	ro.telephony.ril_class=MediaTekRIL \
	ro.telephony.ril.config=fakeiccid  \
	persist.call_recording.enabled=true \
	persist.call_recording.src=1 \
	persist.service.acm.enable=0 \
	persist.sys.dun.override=0 \
	camera.disable_zsl_mode=1

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	libnl_2 \
	libtinyxml\
	libxlog \
   	libstlport

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs \
    ext4_resize \
    resize_ext4 \
    superumount 
# Sensor Calibration
PRODUCT_PACKAGES += libem_sensor_jni

# Include IMSEnabler
PRODUCT_PACKAGES += \
    IMSEnabler
 
#App YGPS
PRODUCT_PACKAGES += \
    YGPS

# Keyhandler
PRODUCT_PACKAGES += \
    com.cyanogenmod.keyhandler

PRODUCT_SYSTEM_SERVER_JARS += com.cyanogenmod.keyhandler

# Never dexopt the keyhandler
$(call add-product-dex-preopt-module-config,com.cyanogenmod.keyhandler,disable)

# Fingerprint
PRODUCT_PACKAGES += \
    libgoodixfingerprintd_binder \
    fingerprintd \
    goodixfingerprintd

PRODUCT_PACKAGES += \
    GFManager

PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8

