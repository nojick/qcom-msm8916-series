LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := ido_firmware
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)

# Create directory for wlan NV BIN file
LOCAL_POST_INSTALL_CMD += mkdir -p $(addprefix $(TARGET_OUT_VENDOR)/, \
			  firmware/wlan/prima);

# Symlink non-splitted venus fimware for backward compatibility
LOCAL_POST_INSTALL_CMD += \
    mkdir -p $(TARGET_OUT_VENDOR)/firmware/qcom/venus-1.8/ ; \
    ln -sf venus.mbn $(TARGET_OUT_VENDOR)/firmware/qcom/venus-1.8/venus.mdt;

include $(BUILD_PHONY_PACKAGE)
