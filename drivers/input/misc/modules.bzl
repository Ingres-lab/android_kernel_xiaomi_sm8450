def register_modules(registry):
    registry.register(
        name = "drivers/input/misc/pm8941-pwrkey",
        out = "pm8941-pwrkey.ko",
        config = "CONFIG_INPUT_PM8941_PWRKEY",
        srcs = [
            # do not sort
            "drivers/input/misc/pm8941-pwrkey.c",
        ],
    )

    registry.register(
        name = "drivers/input/misc/qcom-hv-haptics",
        out = "qcom-hv-haptics.ko",
        config = "CONFIG_INPUT_QCOM_HV_HAPTICS",
        srcs = [
            # do not sort
            "drivers/input/misc/qcom-hv-haptics.c",
            "drivers/input/misc/qcom-hv-haptics-debugfs.h",
        ],
        deps = [
            # do not sort
            "drivers/power/supply/qti_battery_charger",
            "drivers/soc/qcom/panel_event_notifier",
            "drivers/soc/qcom/qti_pmic_glink",
            "drivers/soc/qcom/pdr_interface",
            "drivers/soc/qcom/qmi_helpers",
            "drivers/remoteproc/rproc_qcom_common",
            "drivers/rpmsg/qcom_smd",
            "drivers/rpmsg/qcom_glink_smem",
            "drivers/rpmsg/qcom_glink",
            "kernel/trace/qcom_ipc_logging",
            "drivers/soc/qcom/minidump",
            "drivers/soc/qcom/smem",
            "drivers/soc/qcom/debug_symbol",
            "drivers/dma-buf/heaps/qcom_dma_heaps",
            "drivers/iommu/msm_dma_iommu_mapping",
            "drivers/soc/qcom/mem_buf/mem_buf_dev",
            "drivers/soc/qcom/secure_buffer",
            "drivers/firmware/qcom/qcom-scm",
            "drivers/virt/gunyah/gh_rm_drv",
            "drivers/virt/gunyah/gh_msgq",
            "drivers/virt/gunyah/gh_dbl",
            "arch/arm64/gunyah/gh_arm_drv",
        ],
    )

    # ingres: shoulder trigger buttons (game keys)
    registry.register(
        name = "drivers/input/misc/xm_gamekey",
        out = "xm_gamekey.ko",
        config = "CONFIG_INPUT_XM_GAMEKEY",
        srcs = [
            # do not sort
            "drivers/input/misc/xm_gamekey.c",
        ],
    )

    # ingres: Awinic AW86927 haptic driver (also handles AW8697), used by the Neo vibrator HAL
    registry.register(
        name = "drivers/input/misc/aw86927_haptic/aw8697-haptic",
        out = "aw8697-haptic.ko",
        config = "CONFIG_INPUT_AW86927_HAPTIC",
        srcs = [
            # do not sort
            "drivers/input/misc/aw86927_haptic/aw_haptic.c",
            "drivers/input/misc/aw86927_haptic/ringbuffer.c",
            "drivers/input/misc/aw86927_haptic/aw86927.c",
            "drivers/input/misc/aw86927_haptic/aw8697.c",
            "drivers/input/misc/aw86927_haptic/aw86927.h",
            "drivers/input/misc/aw86927_haptic/aw8697.h",
            "drivers/input/misc/aw86927_haptic/aw_config.h",
            "drivers/input/misc/aw86927_haptic/aw_haptic.h",
            "drivers/input/misc/aw86927_haptic/ringbuffer.h",
        ],
    )
