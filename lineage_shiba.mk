#
# SPDX-FileCopyrightText: 2021-2024 The LineageOS Project
# SPDX-FileCopyrightText: 2021-2024 The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common stuff
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device parameters
DEVICE_CODENAME := shiba
DEVICE_PATH := device/google/shusky
VENDOR_PATH := vendor/google/shiba

# Inherit main AOSP device configuration
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

# Inherit shared zuma platform configuration
$(call inherit-product, device/google/zuma/lineage_common.mk)

# Inherit LineageOS device-specific configuration
$(call inherit-product, $(DEVICE_PATH)/$(DEVICE_CODENAME)/device-lineage.mk)

# ------------------------------------------------------------------------------
# EclipseOS Artifact Whitelist
# The build system flags these as invalid unless permitted manually.
# ------------------------------------------------------------------------------
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/permissions/privapp-permissions-com.eclipseos.settings.xml \
    system/priv-app/EclipseOSLauncher/EclipseOSLauncher.apk \
    system/priv-app/EclipseOSSettings/EclipseOSSettings.apk

# ------------------------------------------------------------------------------
# Product identifiers (must follow all inclusion calls)
# ------------------------------------------------------------------------------
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 8
PRODUCT_NAME := eclipse_$(DEVICE_CODENAME)

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Build fingerprint overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="shiba-user 16 BP2A.250805.005 13691446 release-keys" \
    BuildFingerprint=google/shiba/shiba:16/BP2A.250805.005/13691446:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

# Vendor blobs (must be last)
$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
