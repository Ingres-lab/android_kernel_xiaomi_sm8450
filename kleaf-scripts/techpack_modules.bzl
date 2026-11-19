load(":soc_repo_path.bzl", "SOC_MODULES_REPO_PATH")
load("@rules_pkg//pkg:install.bzl", "pkg_install")
load("@rules_pkg//pkg:mappings.bzl", "pkg_files", "strip_prefix")

# ingres (POCO F4 GT, waipio) on 6.12: an explicit list of the techpack targets that provide
# the modules ingres loads on 6.6 (k612-tools/lsmod-6.6-ingres.txt). Entries are
# "<path under sm8450-modules>:<target suffix>"; the label is //<repo>/<path>:waipio_perf_<suffix>.
# Techpacks are added here as their waipio target is ported.
_WAIPIO_TECHPACKS = [
    # aircrack-ng RTL8812AU USB Wi-Fi driver (88XXau.ko)
    "rtl8812au:88XXau",
    "qcom/opensource/mmrm-driver:mmrm_driver",
    "qcom/opensource/mm-drivers/msm_ext_display:msm_ext_display",
    "qcom/opensource/display-drivers:msm_drm",
    "qcom/opensource/synx-kernel/waipio:modules",
    "qcom/opensource/dsp-kernel/waipio:modules",
    "qcom/opensource/securemsm-kernel:smcinvoke_dlkm",
    "qcom/opensource/securemsm-kernel:tz_log_dlkm",
    "qcom/opensource/securemsm-kernel:qseecom_dlkm",
    "qcom/opensource/securemsm-kernel:hdcp_qseecom_dlkm",
    "qcom/opensource/securemsm-kernel:qce50_dlkm",
    "qcom/opensource/securemsm-kernel:qcedev-mod_dlkm",
    "qcom/opensource/securemsm-kernel:qrng_dlkm",
    "qcom/opensource/securemsm-kernel:qcrypto-msm_dlkm",
    "qcom/opensource/securemsm-kernel:tmecom-intf_dlkm",
    "qcom/opensource/bt-kernel:btpower",
    "qcom/opensource/bt-kernel:bt_fm_slim",
    "qcom/opensource/datarmnet:rmnet_ctl",
    "qcom/opensource/datarmnet:rmnet_core",
    "qcom/opensource/datarmnet-ext/aps:aps",
    "qcom/opensource/datarmnet-ext/offload:offload",
    "qcom/opensource/datarmnet-ext/perf:perf",
    "qcom/opensource/datarmnet-ext/perf_tether:perf_tether",
    "qcom/opensource/datarmnet-ext/mem:rmnet_mem",
    "qcom/opensource/datarmnet-ext/sch:sch",
    "qcom/opensource/datarmnet-ext/shs:shs",
    "qcom/opensource/datarmnet-ext/wlan:wlan",
    "qcom/opensource/dataipa:gsim",
    "qcom/opensource/dataipa:ipam",
    "qcom/opensource/dataipa:ipanetm",
    "qcom/opensource/wlan/platform:cnss2",
    "qcom/opensource/wlan/platform:cnss_plat_ipc_qmi_svc",
    "qcom/opensource/wlan/platform:cnss_nl",
    "qcom/opensource/wlan/platform:cnss_prealloc",
    "qcom/opensource/wlan/platform:cnss_utils",
    "qcom/opensource/wlan/platform:wlan_firmware_service",
    "qcom/opensource/wlan/qcacld-3.0:qca_cld_qca6490",
    "nxp/opensource/driver:nxp-nci",
]

def define_techpack_modules(target, msm_target, variant):
    if msm_target == "waipio":
        techpack_targets = []
        for entry in _WAIPIO_TECHPACKS:
            path, suffix = entry.split(":")
            techpack_targets.append("//{}/{}:{}_{}".format(SOC_MODULES_REPO_PATH, path, target, suffix))
    else:
        techpack_targets = _all_techpack_targets(target)
    return _define_dist(target, techpack_targets)

def _all_techpack_targets(target):
    return [
        "//{}/qcom/opensource/fingerprint:{}_qbt_handler".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/bt-kernel:{}_btpower".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/bt-kernel:{}_radio-i2c-rtc6226-qca".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/bt-kernel:{}_btfm_slim_codec".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/bt-kernel:{}_btfmcodec".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/bt-kernel:{}_bt_fm_swr".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/bt-kernel:{}_spi_cnss_proto".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/camera-kernel:{}_camera".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/dsp-kernel:{}_frpc-adsprpc".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/eva-kernel:{}_eva_modules".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_smcinvoke_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_qcrypto-msm_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_tz_log_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_qseecom_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_hdcp_qseecom_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_qce50_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_qcedev-mod_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_qrng_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_smmu_proxy_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_tmecom-intf_dlkm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_seccam_test_driver".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_hdcp2p2_test".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_si_core_test".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/securemsm-kernel:{}_tornado_mod".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/spu-kernel:{}_spcom".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/spu-kernel:{}_spss_utils".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/synx-kernel:{}_modules".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/touch-drivers:{}_touch_modules".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet:{}_rmnet_ctl".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet:{}_rmnet_core".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet-ext/aps:{}_aps".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet-ext/offload:{}_offload".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet-ext/perf:{}_perf".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet-ext/perf_tether:{}_perf_tether".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet-ext/mem:{}_rmnet_mem".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet-ext/sch:{}_sch".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet-ext/shs:{}_shs".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/datarmnet-ext/wlan:{}_wlan".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/mm-drivers/sync_fence:{}_sync_fence".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/mm-drivers/hw_fence:{}_msm_hw_fence".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/mm-drivers/hfi_core:{}_msm_hfi_core".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/mm-drivers/msm_ext_display:{}_msm_ext_display".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/mmrm-driver:{}_mmrm_driver".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/audio-kernel:{}_modules".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/dataipa:{}_gsim".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/dataipa:{}_ipam".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/dataipa:{}_ipanetm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/data-kernel/drivers/smem-mailbox:{}_smem_mailbox".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/graphics-kernel:{}_msm_kgsl".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/video-driver:{}_video_modules".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/display-drivers:{}_msm_drm".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/qcacld-3.0:{}_qca_cld_peach-v2".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/qcacld-3.0:{}_qca_cld_kiwi-v2".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/qcacld-3.0:{}_qca_cld_wcn7750".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/platform:{}_cnss2".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/platform:{}_cnss_plat_ipc_qmi_svc".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/platform:{}_icnss2".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/platform:{}_cnss_nl".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/platform:{}_cnss_prealloc".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/platform:{}_cnss_utils".format(SOC_MODULES_REPO_PATH, target),
        "//{}/qcom/opensource/wlan/platform:{}_wlan_firmware_service".format(SOC_MODULES_REPO_PATH, target),
        "//{}/nxp/opensource/driver:{}_nxp-nci".format(SOC_MODULES_REPO_PATH, target),
    ]

def _define_dist(target, techpack_targets):
    # 1. Define how files are packaged (permissions + flattening)
    pkg_files(
        name = "{}_all_vendor_module_dist_files".format(target),
        srcs = techpack_targets,
        strip_prefix = strip_prefix.files_only(),  # Equivalent to flat = True
        visibility = ["//visibility:private"],
    )

    # 2. Define the installation to the distribution directory
    pkg_install(
        name = "{}_all_vendor_module_dist".format(target),
        srcs = [":{}_all_vendor_module_dist_files".format(target)],
        destdir = "out/msm-kernel-{}/techpack",  # Equivalent to dist_dir
    )

    return techpack_targets
