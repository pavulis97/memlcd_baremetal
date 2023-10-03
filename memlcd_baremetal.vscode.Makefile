.PHONY = all clean


ifeq ($(OS),Windows_NT)
	POSIX_TOOL_PATH := /Applications/Simplicity Studio.app/Contents/Eclipse/support/common/build/
endif
TOOLCHAIN_DIR := /Applications/Simplicity Studio.app/Contents/Eclipse/developer/toolchains/gnu_arm/10.3_2021.10
SDK_PATH := /Users/pmaksimkin/SimplicityStudio/SDKs/gecko_sdk_3

ARM_GCC_DIR_WIN = 
ARM_GCC_DIR_OSX = /Applications/Simplicity Studio.app/Contents/Eclipse/developer/toolchains/gnu_arm/10.3_2021.10
ARM_GCC_DIR_LINUX = 
POST_BUILD_EXE_WIN = 
POST_BUILD_EXE_OSX = /Applications/Simplicity Studio.app/Contents/Eclipse/developer/adapter_packs/commander/Commander.app/Contents/MacOS/commander
POST_BUILD_EXE_LINUX = 

# Pre-defined definitions in this file
ifeq ($(OS),Windows_NT)
	ARM_GCC_DIR ?= $(ARM_GCC_DIR_WIN)
	POST_BUILD_EXE ?= $(POST_BUILD_EXE_WIN)
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Darwin)
		ARM_GCC_DIR ?= $(ARM_GCC_DIR_OSX)
		POST_BUILD_EXE ?= $(POST_BUILD_EXE_OSX)
	else
		ARM_GCC_DIR ?= $(ARM_GCC_DIR_LINUX)
		POST_BUILD_EXE ?= $(POST_BUILD_EXE_LINUX)
	endif
endif

AR      = "$(ARM_GCC_DIR)/bin/arm-none-eabi-gcc-ar"
CC      = "$(ARM_GCC_DIR)/bin/arm-none-eabi-gcc"
CXX     = "$(ARM_GCC_DIR)/bin/arm-none-eabi-g++"
OBJCOPY = "$(ARM_GCC_DIR)/bin/arm-none-eabi-objcopy"
LD      = "$(ARM_GCC_DIR)/bin/arm-none-eabi-gcc"

# Command output is hidden by default, it can be enabled by
# setting VERBOSE=true on the commandline.
ifeq ($(VERBOSE),)
  ECHO = @
endif

PROJECTNAME := memlcd_baremetal
SRC := .
OUTPUT_DIR := vscode-build
OBJ_DIR := $(OUTPUT_DIR)/obj

ASM_FLAGS := 

C_FLAGS := 

CXX_FLAGS := 
  
LD_FLAGS := 


-include memlcd_baremetal.vscode.project.mak


ASM_INCLUDES := -I"config" -I"autogen" -I"." -I"$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32ZG23/Include" -I"$(COPIED_SDK_PATH)/platform/common/inc" -I"$(COPIED_SDK_PATH)/hardware/board/inc" -I"$(COPIED_SDK_PATH)/platform/driver/button/inc" -I"$(COPIED_SDK_PATH)/platform/CMSIS/Core/Include" -I"$(COPIED_SDK_PATH)/hardware/driver/configuration_over_swo/inc" -I"$(COPIED_SDK_PATH)/platform/driver/debug/inc" -I"$(COPIED_SDK_PATH)/platform/service/device_init/inc" -I"$(COPIED_SDK_PATH)/platform/middleware/glib/dmd" -I"$(COPIED_SDK_PATH)/platform/middleware/glib" -I"$(COPIED_SDK_PATH)/platform/emdrv/common/inc" -I"$(COPIED_SDK_PATH)/platform/emlib/inc" -I"$(COPIED_SDK_PATH)/platform/middleware/glib/glib" -I"$(COPIED_SDK_PATH)/platform/emdrv/gpiointerrupt/inc" -I"$(COPIED_SDK_PATH)/hardware/driver/memlcd/src/ls013b7dh03" -I"$(COPIED_SDK_PATH)/hardware/driver/memlcd/inc" -I"$(COPIED_SDK_PATH)/hardware/driver/memlcd/inc/memlcd_usart" -I"$(COPIED_SDK_PATH)/hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"$(COPIED_SDK_PATH)/platform/peripheral/inc" -I"$(COPIED_SDK_PATH)/platform/common/toolchain/inc" -I"$(COPIED_SDK_PATH)/platform/service/system/inc" -I"$(COPIED_SDK_PATH)/platform/service/sleeptimer/inc" -I"$(COPIED_SDK_PATH)/platform/service/udelay/inc" 
C_INCLUDES := -I"config" -I"autogen" -I"." -I"$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32ZG23/Include" -I"$(COPIED_SDK_PATH)/platform/common/inc" -I"$(COPIED_SDK_PATH)/hardware/board/inc" -I"$(COPIED_SDK_PATH)/platform/driver/button/inc" -I"$(COPIED_SDK_PATH)/platform/CMSIS/Core/Include" -I"$(COPIED_SDK_PATH)/hardware/driver/configuration_over_swo/inc" -I"$(COPIED_SDK_PATH)/platform/driver/debug/inc" -I"$(COPIED_SDK_PATH)/platform/service/device_init/inc" -I"$(COPIED_SDK_PATH)/platform/middleware/glib/dmd" -I"$(COPIED_SDK_PATH)/platform/middleware/glib" -I"$(COPIED_SDK_PATH)/platform/emdrv/common/inc" -I"$(COPIED_SDK_PATH)/platform/emlib/inc" -I"$(COPIED_SDK_PATH)/platform/middleware/glib/glib" -I"$(COPIED_SDK_PATH)/platform/emdrv/gpiointerrupt/inc" -I"$(COPIED_SDK_PATH)/hardware/driver/memlcd/src/ls013b7dh03" -I"$(COPIED_SDK_PATH)/hardware/driver/memlcd/inc" -I"$(COPIED_SDK_PATH)/hardware/driver/memlcd/inc/memlcd_usart" -I"$(COPIED_SDK_PATH)/hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"$(COPIED_SDK_PATH)/platform/peripheral/inc" -I"$(COPIED_SDK_PATH)/platform/common/toolchain/inc" -I"$(COPIED_SDK_PATH)/platform/service/system/inc" -I"$(COPIED_SDK_PATH)/platform/service/sleeptimer/inc" -I"$(COPIED_SDK_PATH)/platform/service/udelay/inc" 
CXX_INCLUDES := -I"config" -I"autogen" -I"." -I"$(COPIED_SDK_PATH)/platform/Device/SiliconLabs/EFR32ZG23/Include" -I"$(COPIED_SDK_PATH)/platform/common/inc" -I"$(COPIED_SDK_PATH)/hardware/board/inc" -I"$(COPIED_SDK_PATH)/platform/driver/button/inc" -I"$(COPIED_SDK_PATH)/platform/CMSIS/Core/Include" -I"$(COPIED_SDK_PATH)/hardware/driver/configuration_over_swo/inc" -I"$(COPIED_SDK_PATH)/platform/driver/debug/inc" -I"$(COPIED_SDK_PATH)/platform/service/device_init/inc" -I"$(COPIED_SDK_PATH)/platform/middleware/glib/dmd" -I"$(COPIED_SDK_PATH)/platform/middleware/glib" -I"$(COPIED_SDK_PATH)/platform/emdrv/common/inc" -I"$(COPIED_SDK_PATH)/platform/emlib/inc" -I"$(COPIED_SDK_PATH)/platform/middleware/glib/glib" -I"$(COPIED_SDK_PATH)/platform/emdrv/gpiointerrupt/inc" -I"$(COPIED_SDK_PATH)/hardware/driver/memlcd/src/ls013b7dh03" -I"$(COPIED_SDK_PATH)/hardware/driver/memlcd/inc" -I"$(COPIED_SDK_PATH)/hardware/driver/memlcd/inc/memlcd_usart" -I"$(COPIED_SDK_PATH)/hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"$(COPIED_SDK_PATH)/platform/peripheral/inc" -I"$(COPIED_SDK_PATH)/platform/common/toolchain/inc" -I"$(COPIED_SDK_PATH)/platform/service/system/inc" -I"$(COPIED_SDK_PATH)/platform/service/sleeptimer/inc" -I"$(COPIED_SDK_PATH)/platform/service/udelay/inc" 

-include $(CDEPS)
-include $(CXXDEPS)
-include $(ASMDEPS_s)
-include $(ASMDEPS_S)

rwildcard=$(foreach d,$(wildcard $(1:=/*)),$(call rwildcard,$d,$2) $(filter $(subst *,%,$2),$d))

ASM_SOURCES := $(call rwildcard, $(SRC), *.s) $(call rwildcard, $(SRC), *.S)
C_SOURCES := $(call rwildcard, $(SRC), *.c)
CXX_SOURCES := $(call rwildcard, $(SRC), *.cpp) $(call rwildcard, $(SRC), *.cc)

ASM_OBJECTS := $(patsubst $(SRC)/%.s, $(OBJ_DIR)/%.o, $(filter %s, $(ASM_SOURCES)))
ASM_OBJECTS += $(patsubst $(SRC)/%.S, $(OBJ_DIR)/%.o, $(filter %S, $(ASM_SOURCES)))
C_OBJECTS := $(patsubst $(SRC)/%.c, $(OBJ_DIR)/%.o, $(filter %c, $(C_SOURCES)))
CXX_OBJECTS := $(patsubst $(SRC)/%.cpp, $(OBJ_DIR)/%.o, $(filter %cpp, $(CXX_SOURCES)))
CXX_OBJECTS += $(patsubst $(SRC)/%.cc, $(OBJ_DIR)/%.o, $(filter %cc, $(CXX_SOURCES)))
PROJ_OBJECTS := $(ASM_OBJECTS)
PROJ_OBJECTS += $(C_OBJECTS)
PROJ_OBJECTS += $(CXX_OBJECTS)

ASM_FLAGS += -MP -MD
C_FLAGS += -MP -MD
CXX_FLAGS += -MP -MD

override CFLAGS = $(C_FLAGS) $(C_DEFS) $(INCLUDES) $(DEPFLAGS)
override CXXFLAGS = $(CXX_FLAGS) $(C_DEFS) $(INCLUDES) $(DEPFLAGS)
override ASMFLAGS = $(ASM_FLAGS) $(ASM_DEFS) $(INCLUDES) $(DEPFLAGS)

DEPS := $(C_OBJECTS:%.o=%.d)

all: pre-build $(OUTPUT_DIR)/$(PROJECTNAME).out post-build
	$(ECHO)$(OBJCOPY) $(OUTPUT_DIR)/$(PROJECTNAME).out -O binary $(OUTPUT_DIR)/$(PROJECTNAME).bin
	$(ECHO)$(OBJCOPY) $(OUTPUT_DIR)/$(PROJECTNAME).out -O ihex $(OUTPUT_DIR)/$(PROJECTNAME).hex
	$(ECHO)$(OBJCOPY) $(OUTPUT_DIR)/$(PROJECTNAME).out -O srec $(OUTPUT_DIR)/$(PROJECTNAME).s37

clean:
	$(POSIX_TOOL_PATH)rm -rf $(OUTPUT_DIR)

$(OUTPUT_DIR)/$(PROJECTNAME).out: $(OBJS) $(PROJ_OBJECTS) $(LIB_FILES)
	@$(POSIX_TOOL_PATH)echo 'Linking $(OUTPUT_DIR)/$(PROJECTNAME).out'
ifeq ($(UNAME_S),Darwin)
	@echo $(OBJS) > $(OUTPUT_DIR)/objs
	@echo $(PROJ_OBJECTS) > $(OUTPUT_DIR)/proj_objs
else
	$(file > $(OUTPUT_DIR)/objs,$(OBJS))
	$(file > $(OUTPUT_DIR)/proj_objs,$(PROJ_OBJECTS))
endif
	$(ECHO)$(LD) @$(OUTPUT_DIR)/objs @$(OUTPUT_DIR)/proj_objs $(LIBS) $(LD_FLAGS) -o $(OUTPUT_DIR)/$(PROJECTNAME).out

$(OBJ_DIR)/%.o: $(SRC)/%.s
	@$(POSIX_TOOL_PATH)echo 'Building $<'
	$(ECHO)$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c "$<" -o "$@"

$(OBJ_DIR)/%.o: $(SRC)/%.S
	@$(POSIX_TOOL_PATH)echo 'Building $<'
	$(ECHO)$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(ASMFLAGS) -c "$<" -o "$@"

$(OBJ_DIR)/%.o: $(SRC)/%.c
	@$(POSIX_TOOL_PATH)echo 'Building $<'
	$(ECHO)$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CFLAGS) -c "$<" -o "$@"

$(OBJ_DIR)/%.o: $(SRC)/%.cpp
	@$(POSIX_TOOL_PATH)echo 'Building $<'
	$(ECHO)$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CXXFLAGS) -c "$<" -o "$@"

$(OBJ_DIR)/%.o: $(SRC)/%.cc
	@$(POSIX_TOOL_PATH)echo 'Building $<'
	$(ECHO)$(POSIX_TOOL_PATH)mkdir -p $(@D)
	$(ECHO)$(CC) $(CXXFLAGS) -c "$<" -o "$@"

-include $(DEPS)