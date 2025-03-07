#
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/bq/sdm660-common/sdm660-common-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/bq/sdm660-common/overlay
PRODUCT_ENFORCE_RRO_TARGETS += *

# Properties
-include device/bq/sdm660-common/vendor_prop.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Audio
$(call inherit-product, hardware/qcom-caf/msm8998/configs/sdm660/sdm660.mk)

PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    device/bq/sdm660-common/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    device/bq/sdm660-common/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    device/bq/sdm660-common/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/bq/sdm660-common/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    device/bq/sdm660-common/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    device/bq/sdm660-common/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    device/bq/sdm660-common/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    device/bq/sdm660-common/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    device/bq/sdm660-common/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.sdm660 \
    bootctrl.sdm660.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0 \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio@2.0-impl:32 \
    vendor.qti.hardware.btconfigstore@1.0.vendor

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Camera
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/configs/camera/camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config.xml \
    device/bq/sdm660-common/configs/camera/zangya_camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/zangya_camera.xml \
    device/bq/sdm660-common/configs/camera/mct_pipeline.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mct_pipeline.xml \
    device/bq/sdm660-common/configs/camera/s5k2l8_holitech_zangya_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k2l8_holitech_zangya_chromatix.xml \
    device/bq/sdm660-common/configs/camera/s5k2l8_ofilm_zangya_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k2l8_ofilm_zangya_chromatix.xml \
    device/bq/sdm660-common/configs/camera/s5k4h7yx_holitech_zangya_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k4h7yx_holitech_zangya_chromatix.xml \
    device/bq/sdm660-common/configs/camera/s5k4h7yx_ofilm_zangya_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k4h7yx_ofilm_zangya_chromatix.xml \
    device/bq/sdm660-common/configs/camera/s5k5e8_holitech_zangya_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k5e8_holitech_zangya_chromatix.xml \
    device/bq/sdm660-common/configs/camera/s5k5e8_ofilm_oef0695_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/s5k5e8_ofilm_oef0695_chromatix.xml

PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0 \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    libxml2 \
    Snap

# CABL
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/configs/cabl/CABLConfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/CABLConfig.xml

# Component overrides
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/configs/component-overrides.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sysconfig/component-overrides.xml

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.1-service.clearkey \
    android.hardware.drm@1.2-service.clearkey \
    android.hardware.drm@1.3-service.clearkey \
    move_widevine_data.sh

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    copybit.sdm660 \
    gralloc.sdm660 \
    libdisplayconfig \
    liboverlay \
    libqdMetaData.system \
    libtinyxml \
    libvulkan \
    memtrack.sdm660

# FBE support
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/rootdir/etc/init.qti.qseecomd.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qti.qseecomd.sh

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# DPM
PRODUCT_PACKAGES += \
    libshim_dpmframework

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1 \
    android.hardware.biometrics.fingerprint@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0_system \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common

# HW crypto
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0-service-qti.qsee

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.usb.rc \
    init.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qcom.rc \
    init.qcom.usb.sh \
    init.target.rc \
    init.bq.usb.configfs.rc \
    init.msm.usb.configfs.rc \
    ueventd.qcom.rc

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    libipanat \
    liboffloadhal

# IRSC
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# LED packages
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.sdm660-common

# Media
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/bq/sdm660-common/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/bq/sdm660-common/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Network
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    NfcNci \
    SecureElement \
    Tag

PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    device/bq/sdm660-common/configs/nfc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp_RF.conf

# OEM Unlock
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.oem_unlock_supported=1

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti \
    android.hardware.power.stats@1.0-service.mock \
    vendor.qti.hardware.perf@2.0.vendor

# QCOM
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/configs/privapp-permissions-sdm660.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-sdm660.xml \
    device/bq/sdm660-common/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    device/bq/sdm660-common/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml \
    device/bq/sdm660-common/configs/telephony_product_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/product/etc/permissions/telephony_product_privapp-permissions-qti.xml

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full-vendorcompat \
    libprotobuf-cpp-lite-vendorcompat

# QMI
PRODUCT_PACKAGES += \
    libjson

# QTI
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.0 \
    android.hardware.radio@1.1 \
    android.hardware.radio@1.2 \
    android.hardware.radio@1.3 \
    android.hardware.radio@1.4 \
    android.hardware.radio.config@1.0 \
    android.hardware.secure_element@1.0 \
    librmnetctl \
    libprotobuf-cpp-full

# RCS
PRODUCT_PACKAGES += \
    rcs_service_aidl \
    rcs_service_aidl.xml \
    rcs_service_api \
    rcs_service_api.xml

# Recovery
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/recovery/root/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    device/bq/sdm660-common/recovery/root/init.recovery.zangya.usb.rc:root/init.recovery.zangya.usb.rc

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Seccomp
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/seccomp/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    device/bq/sdm660-common/seccomp/mediaextractor-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/bq/sdm660-common

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service \
    thermal.sdm660

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Tethering
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Touchscreen
PRODUCT_PACKAGES += \
    libtinyxml2

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# Verity
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/c0c4000.sdhci/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/c0c4000.sdhci/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Wi-Fi
PRODUCT_COPY_FILES += \
    device/bq/sdm660-common/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    device/bq/sdm660-common/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    device/bq/sdm660-common/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    hostapd \
    libwifi-hal-ctrl \
    libwifi-hal-qcom \
    libwpa_client \
    TetheringConfigOverlay \
    WifiOverlay \
    wpa_supplicant \
    wpa_supplicant.conf
