##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 5c3cae6
LDD_SITE = git@github.com:shribi/aeld-assignment-7.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

define LDD_BUILD_CMDS
	@echo "============= Make: $(MAKE)"
	@echo "============= LINUX_DIR: $(LINUX_DIR)"
	@echo "============= KERNEL_ARCH: $(KERNEL_ARCH)"
	@echo "============= TARGET_CROSS: $(TARGET_CROSS)"
	@echo "============= LINUX_VERSION_PROBED: $(LINUX_VERSION_PROBED)"
	$(MAKE) -C $(@D)/misc-modules MODULE_SUBDIRS=$(@D)/misc-modules KERNELDIR=$(LINUX_DIR) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(TARGET_CROSS)
	$(MAKE) -C $(@D)/scull MODULE_SUBDIRS=$(@D)/scull KERNELDIR=$(LINUX_DIR) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(TARGET_CROSS)
endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/ldd
	$(INSTALL) -m 0755 $(@D)/scull/*.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/ldd
endef

$(eval $(generic-package))
