def register_modules(registry):
    registry.register(
        name = "drivers/input/touchscreen/cap1296",
        out = "cap1296.ko",
        config = "CONFIG_TOUCHSCREEN_CAP1296",
        srcs = [
            # do not sort
            "drivers/input/touchscreen/cap1296.c",
            "drivers/input/touchscreen/cap1296.h",
        ],
    )

    # ingres: Xiaomi touch feature framework (was built into the 6.6 kernel image)
    registry.register(
        name = "drivers/input/touchscreen/xiaomi/xiaomi_touch",
        out = "xiaomi_touch.ko",
        config = "CONFIG_TOUCHSCREEN_XIAOMI_TOUCHFEATURE",
        srcs = [
            # do not sort
            "drivers/input/touchscreen/xiaomi/xiaomi_touch.c",
            "drivers/input/touchscreen/xiaomi/xiaomi_touch.h",
        ],
        deps = [
            # do not sort
            "drivers/soc/qcom/panel_event_notifier",
        ],
    )

    # ingres: ST FTS v5.2.1 SPI touch controller (module fts_touch_spi)
    registry.register(
        name = "drivers/input/touchscreen/fts_spi/fts_touch_spi",
        out = "fts_touch_spi.ko",
        config = "CONFIG_TOUCHSCREEN_ST_FTS_V521_SPI",
        srcs = [
            # do not sort
            "drivers/input/touchscreen/fts_spi/fts.c",
            "drivers/input/touchscreen/fts_spi/fts_proc.c",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsCompensation.c",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsCore.c",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsError.c",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsFrame.c",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsIO.c",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsTest.c",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsTool.c",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsFlash.c",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsGesture.c",
            "drivers/input/touchscreen/fts_spi/fts.h",
            "drivers/input/touchscreen/xiaomi/xiaomi_touch.h",
            "drivers/input/touchscreen/fts_spi/fts_fw.h",
            "drivers/input/touchscreen/fts_spi/fts_limits.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsCompensation.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsCore.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsError.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsFlash.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsFrame.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsGesture.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsHardware.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsIO.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsSoftware.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsTest.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsTime.h",
            "drivers/input/touchscreen/fts_spi/fts_lib/ftsTool.h",
            "drivers/misc/hwid/hwid.h",
        ],
        includes = [
            # do not sort
            "drivers/misc/hwid",
        ],
        copts = ["-DCONFIG_I2C_BY_DMA"],
        deps = [
            # do not sort
            "drivers/input/touchscreen/xiaomi/xiaomi_touch",
            "drivers/misc/hwid/hwid",
            "drivers/soc/qcom/panel_event_notifier",
        ],
    )

    # ingres: upstream Atmel maXTouch driver, loaded on 6.6
    registry.register(
        name = "drivers/input/touchscreen/atmel_mxt_ts",
        out = "atmel_mxt_ts.ko",
        config = "CONFIG_TOUCHSCREEN_ATMEL_MXT",
        srcs = [
            # do not sort
            "drivers/input/touchscreen/atmel_mxt_ts.c",
        ],
    )
