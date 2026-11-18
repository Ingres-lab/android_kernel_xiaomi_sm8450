# ingres (POCO F4 GT / Redmi K50 Gaming) fingerprint sensors. Built into the 6.6
# kernel image; vendor modules on GKI 6.12.
def register_modules(registry):
    registry.register(
        name = "drivers/input/fingerprint/fpc_1540/fpc1540",
        out = "fpc1540.ko",
        config = "CONFIG_FINGERPRINT_FPC_1540",
        srcs = [
            # do not sort
            "drivers/input/fingerprint/fpc_1540/fpc1020_tee.c",
        ],
        deps = [
            # do not sort
            "drivers/soc/qcom/panel_event_notifier",
        ],
    )

    registry.register(
        name = "drivers/input/fingerprint/goodix_tee/goodix_tee",
        out = "goodix_tee.ko",
        config = "CONFIG_FINGERPRINT_GOODIX_TEE",
        srcs = [
            # do not sort
            "drivers/input/fingerprint/goodix_tee/gf_spi.c",
            "drivers/input/fingerprint/goodix_tee/platform.c",
            "drivers/input/fingerprint/goodix_tee/netlink.c",
            "drivers/input/fingerprint/goodix_tee/gf_spi.h",
        ],
    )

    registry.register(
        name = "drivers/input/fingerprint/xiaomi_fp/xiaomifp",
        out = "xiaomifp.ko",
        config = "CONFIG_FINGERPRINT_XIAOMI_FP",
        srcs = [
            # do not sort
            "drivers/input/fingerprint/xiaomi_fp/xiaomi_fingerprint.c",
        ],
    )
