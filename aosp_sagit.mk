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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sagit device
$(call inherit-product, device/xiaomi/sagit/device.mk)

# Inherit some common AOSP stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)
#<--------------selective ones--------------------------------------->
#If you don't have below ones it's okay to build
# MiuiCamera
$(call inherit-product-if-exists, vendor/apps/MiuiCamera/config.mk)
# GoogleCamera
$(call inherit-product-if-exists, vendor/apps/GoogleCamera/config.mk)

# Firmware
$(call inherit-product-if-exists, vendor/apps/firmware-sagit/config.mk)

# ScreenRecorder
$(call inherit-product-if-exists, vendor/apps/OPScreenRecord/config.mk)

# FaceUnlock
$(call inherit-product-if-exists, vendor/apps/FaceUnlock/config.mk)
#<-------------------------------------------------------------------->

PRODUCT_NAME := aosp_sagit
PRODUCT_DEVICE := sagit
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI 6
PRODUCT_MANUFACTURER := Xiaomi
TARGET_FACE_UNLOCK := true
TARGET_GAPPS_ARCH := arm64
TARGET_BOOT_ANIMATION_RES := 1080
KBUILD_BUILD_USER := DavidKoller
KBUILD_BUILD_HOST := sagit
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sagit-user 8.0.0 OPR1.170623.027 V9.2.3.0.OCAMIEK release-keys"

BUILD_FINGERPRINT := Xiaomi/sagit/sagit:8.0.0/OPR1.170623.027/V9.2.3.0.OCAMIEK:user/release-keys
