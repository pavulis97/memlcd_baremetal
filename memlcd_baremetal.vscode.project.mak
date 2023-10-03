####################################################################
# Automatically-generated file. Do not edit!                       #
# Makefile Version 15                                              #
####################################################################

BASE_SDK_PATH = /Users/pmaksimkin/SimplicityStudio/SDKs/gecko_sdk_3
UNAME:=$(shell $(POSIX_TOOL_PATH)uname -s | $(POSIX_TOOL_PATH)sed -e 's/^\(CYGWIN\).*/\1/' | $(POSIX_TOOL_PATH)sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell $(POSIX_TOOL_PATH)echo $(BASE_SDK_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
COPIED_SDK_PATH ?= gecko_sdk_4.3.1

# This uses the explicit build rules below
PROJECT_SOURCE_FILES =

C_SOURCE_FILES   += $(filter %.c, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cpp, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cc, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.s, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.S, $(PROJECT_SOURCE_FILES))
LIB_FILES        += $(filter %.a, $(PROJECT_SOURCE_FILES))

C_DEFS += \
 '-DDEBUG_EFM=1' \
 '-DEFR32ZG23B020F512IM48=1' \
 '-DSL_BOARD_NAME="BRD4210A"' \
 '-DSL_BOARD_REV="A01"' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1'

ASM_DEFS += \
 '-DDEBUG_EFM=1' \
 '-DEFR32ZG23B020F512IM48=1' \
 '-DSL_BOARD_NAME="BRD4210A"' \
 '-DSL_BOARD_REV="A01"' \
 '-DHARDWARE_BOARD_DEFAULT_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_2_RF_BANDS=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_868=1' \
 '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_915=1' \
 '-DSL_COMPONENT_CATALOG_PRESENT=1'

INCLUDES += \
 -Iconfig \
 -Iautogen \
 -I. \
 -I$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32ZG23/Include \
 -I$(COPIED_SDK_PATH)/platform/common/inc \
 -I$(COPIED_SDK_PATH)/hardware/board/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/button/inc \
 -I$(COPIED_SDK_PATH)/platform/CMSIS/Core/Include \
 -I$(COPIED_SDK_PATH)/hardware/driver/configuration_over_swo/inc \
 -I$(COPIED_SDK_PATH)/platform/driver/debug/inc \
 -I$(COPIED_SDK_PATH)/platform/service/device_init/inc \
 -I$(COPIED_SDK_PATH)/platform/middleware/glib/dmd \
 -I$(COPIED_SDK_PATH)/platform/middleware/glib \
 -I$(COPIED_SDK_PATH)/platform/emdrv/common/inc \
 -I$(COPIED_SDK_PATH)/platform/emlib/inc \
 -I$(COPIED_SDK_PATH)/platform/middleware/glib/glib \
 -I$(COPIED_SDK_PATH)/platform/emdrv/gpiointerrupt/inc \
 -I$(COPIED_SDK_PATH)/hardware/driver/memlcd/src/ls013b7dh03 \
 -I$(COPIED_SDK_PATH)/hardware/driver/memlcd/inc \
 -I$(COPIED_SDK_PATH)/hardware/driver/memlcd/inc/memlcd_usart \
 -I$(COPIED_SDK_PATH)/hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart \
 -I$(COPIED_SDK_PATH)/platform/peripheral/inc \
 -I$(COPIED_SDK_PATH)/platform/common/toolchain/inc \
 -I$(COPIED_SDK_PATH)/platform/service/system/inc \
 -I$(COPIED_SDK_PATH)/platform/service/sleeptimer/inc \
 -I$(COPIED_SDK_PATH)/platform/service/udelay/inc

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

LIB_FILES += $(filter %.a, $(PROJECT_LIBS))

C_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c99 \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 -mcmse \
 --specs=nano.specs \
 -g

CXX_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -std=c++11 \
 -fno-rtti \
 -fno-exceptions \
 -Wall \
 -Wextra \
 -Os \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 -mcmse \
 --specs=nano.specs \
 -g

ASM_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -imacros sl_gcc_preinclude.h \
 -x assembler-with-cpp

LD_FLAGS += \
 -mcpu=cortex-m33 \
 -mthumb \
 -mfpu=fpv5-sp-d16 \
 -mfloat-abi=hard \
 -T"autogen/linkerfile.ld" \
 --specs=nano.specs \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -Wl,--gc-sections


####################################################################
# Pre/Post Build Rules                                             #
####################################################################
pre-build:
	# No pre-build defined

post-build: $(OUTPUT_DIR)/$(PROJECTNAME).out
	# No post-build defined

####################################################################
# SDK Build Rules                                                  #
####################################################################
# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA