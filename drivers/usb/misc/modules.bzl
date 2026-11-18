def register_modules(registry):
    registry.register(
        name = "drivers/usb/misc/lvstest",
        out = "lvstest.ko",
        config = "CONFIG_USB_LINK_LAYER_TEST",
        srcs = [
            # do not sort
            "drivers/usb/misc/lvstest.c",
        ],
    )

    # ingres: upstream driver, shipped in vendor_dlkm as on 6.6
    registry.register(
        name = "drivers/usb/misc/ehset",
        out = "ehset.ko",
        config = "CONFIG_USB_EHSET_TEST_FIXTURE",
        srcs = [
            # do not sort
            "drivers/usb/misc/ehset.c",
        ],
    )
