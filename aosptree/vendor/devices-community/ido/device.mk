# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2023 The GloDroid project

$(call inherit-product, glodroid/configuration/common/device-common.mk)

GD_NO_DEFAULT_GRAPHICS := true
GD_USE_RS_HWCOMPOSER := true
GD_NO_DEFAULT_CODECS := true
GD_NO_DEFAULT_FASTBOOTD := true
GD_NO_DEFAULT_BOOTCTL   := true
GD_NO_DEFAULT_CAMERA    := true
GD_NO_DEFAULT_APPS      := true

DEVICE_MANIFEST_FILE += \
	vendor/devices-community/ido/android.hardware.graphics.composer.xml \

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

# Files from linux-firmware
PRODUCT_COPY_FILES += \
    glodroid/linux-firmware/qcom/a420_pfp.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/a420_pfp.fw \
    glodroid/linux-firmware/qcom/a420_pm4.fw:$(TARGET_COPY_OUT_VENDOR)/firmware/a420_pm4.fw \
    glodroid/linux-firmware/qcom/venus-1.8/venus.mbn:$(TARGET_COPY_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.mbn \

# WCNSS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/firmware/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/firmware/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/firmware/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/firmware/wifi/WCNSS_wlan_dictionary.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_wlan_dictionary.dat \
    $(LOCAL_PATH)/firmware/modem/wcnss.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b00 \
    $(LOCAL_PATH)/firmware/modem/wcnss.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b01 \
    $(LOCAL_PATH)/firmware/modem/wcnss.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b02 \
    $(LOCAL_PATH)/firmware/modem/wcnss.b04:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b04 \
    $(LOCAL_PATH)/firmware/modem/wcnss.b06:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b06 \
    $(LOCAL_PATH)/firmware/modem/wcnss.b09:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b09 \
    $(LOCAL_PATH)/firmware/modem/wcnss.b10:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b10 \
    $(LOCAL_PATH)/firmware/modem/wcnss.b11:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.b11 \
    $(LOCAL_PATH)/firmware/modem/wcnss.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/wcnss.mdt \
    $(LOCAL_PATH)/firmware/modem/mba.mbn:$(TARGET_COPY_OUT_VENDOR)/firmware/mba.mbn \
    $(LOCAL_PATH)/firmware/modem/modem.b00:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b00 \
    $(LOCAL_PATH)/firmware/modem/modem.b01:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b01 \
    $(LOCAL_PATH)/firmware/modem/modem.b02:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b02 \
    $(LOCAL_PATH)/firmware/modem/modem.b03:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b03 \
    $(LOCAL_PATH)/firmware/modem/modem.b04:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b04 \
    $(LOCAL_PATH)/firmware/modem/modem.b05:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b05 \
    $(LOCAL_PATH)/firmware/modem/modem.b06:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b06 \
    $(LOCAL_PATH)/firmware/modem/modem.b08:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b08 \
    $(LOCAL_PATH)/firmware/modem/modem.b09:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b09 \
    $(LOCAL_PATH)/firmware/modem/modem.b12:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b12 \
    $(LOCAL_PATH)/firmware/modem/modem.b13:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b13 \
    $(LOCAL_PATH)/firmware/modem/modem.b14:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b14 \
    $(LOCAL_PATH)/firmware/modem/modem.b15:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b15 \
    $(LOCAL_PATH)/firmware/modem/modem.b16:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b16 \
    $(LOCAL_PATH)/firmware/modem/modem.b17:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b17 \
    $(LOCAL_PATH)/firmware/modem/modem.b18:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b18 \
    $(LOCAL_PATH)/firmware/modem/modem.b21:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b21 \
    $(LOCAL_PATH)/firmware/modem/modem.b22:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b22 \
    $(LOCAL_PATH)/firmware/modem/modem.b23:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b23 \
    $(LOCAL_PATH)/firmware/modem/modem.b25:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b25 \
    $(LOCAL_PATH)/firmware/modem/modem.b26:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.b26 \
    $(LOCAL_PATH)/firmware/modem/modem.mdt:$(TARGET_COPY_OUT_VENDOR)/firmware/modem.mdt \

# Symlink firmware files from device partitions
PRODUCT_PACKAGES += ido_firmware

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/init.rmtfs.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.rmtfs.rc \
    $(LOCAL_PATH)/etc/sensors.ido.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/sensors.ido.rc \
    $(LOCAL_PATH)/etc/uevent.device.rc:$(TARGET_COPY_OUT_VENDOR)/etc/uevent.device.rc \
    glodroid/configuration/common/no_suspend.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/no_suspend.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/audio.ido.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio.ido.xml \

# Lights HAL
PRODUCT_PACKAGES += \
    android.hardware.lights-service \

# Sensors HAL
PRODUCT_PACKAGES += \
    sensors.iio \
    android.hardware.sensors@1.0-impl:64 \
    android.hardware.sensors@1.0-service \

# qcom modem/DSP services
PRODUCT_PACKAGES += \
    rmtfs \
    tqftpserv \

# Graphics linaro config.
$(call inherit-product, vendor/devices-community/ido/shared/graphics/drm_hwcomposer/device.mk)
$(call inherit-product, vendor/devices-community/ido/shared/graphics/mesa/device.mk)
$(call inherit-product, vendor/devices-community/ido/shared/graphics/minigbm_msm/device.mk)

PRODUCT_VENDOR_PROPERTIES += \
	vendor.minigbm.debug=nocompression \

# RRO that disables round items in quicksetting menu to increase performance
PRODUCT_PACKAGES += \
    SystemUISlowGpu

# Bluetooth
PRODUCT_VENDOR_PROPERTIES += \
    bluetooth.device.class_of_device=90,2,12 \
    bluetooth.profile.asha.central.enabled=true \
    bluetooth.profile.a2dp.source.enabled=true \
    bluetooth.profile.avrcp.target.enabled=true \
    bluetooth.profile.bap.broadcast.assist.enabled=true \
    bluetooth.profile.bap.unicast.client.enabled=true \
    bluetooth.profile.bas.client.enabled=true \
    bluetooth.profile.csip.set_coordinator.enabled=true \
    bluetooth.profile.gatt.enabled=true \
    bluetooth.profile.hap.client.enabled=true \
    bluetooth.profile.hfp.ag.enabled=true \
    bluetooth.profile.hid.device.enabled=true \
    bluetooth.profile.hid.host.enabled=true \
    bluetooth.profile.map.server.enabled=true \
    bluetooth.profile.mcp.server.enabled=true \
    bluetooth.profile.opp.enabled=true \
    bluetooth.profile.pan.nap.enabled=true \
    bluetooth.profile.pan.panu.enabled=true \
    bluetooth.profile.pbap.server.enabled=true \
    bluetooth.profile.sap.server.enabled=true \
    bluetooth.profile.ccp.server.enabled=true \
    bluetooth.profile.vcp.controller.enabled=true \
    persist.bluetooth.a2dp_aac.vbr_supported=true \

