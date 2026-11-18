def register_modules(registry):
    # ingres: IR blaster (upstream ir-spi with a 32 KiB buffer)
    registry.register(
        name = "drivers/media/rc/ir-spi",
        out = "ir-spi.ko",
        config = "CONFIG_IR_SPI_XIAOMI",
        srcs = [
            # do not sort
            "drivers/media/rc/ir-spi.c",
        ],
    )
