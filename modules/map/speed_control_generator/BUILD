load("//tools:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "util",
    srcs = [
        "cJSON.cc",
        "cfg_item.cc",
        "scg_cfg.cc",
        "smooth_item.cc",
        "smooth_mgr.cc",
    ],
    hdrs = [
        "cJSON.h",
        "cfg_item.h",
        "scg_cfg.h",
        "smooth_item.h",
        "smooth_mgr.h",
    ],
    deps = [
        "//modules/map/proto:map_proto",
        "//modules/common/util:util",
    ],
)

cc_binary(
    name = "scg",
    srcs = ["main.cc"],
    deps = [
        ":util",
    ],
)

cpplint()
