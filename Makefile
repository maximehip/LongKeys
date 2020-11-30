THEOS_DEVICE_IP = localhost
THEOS_DEVICE_PORT = 2223
ARCHS = arm64 arm64e
FINALPACKAGE=1

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LongKeys

LongKeys_FILES = Tweak.x
LongKeys_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
