
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "config_gflags",
    srcs = [
        "config_gflags.cc",
    ],
    hdrs = [
        "config_gflags.h",
    ],
    data = [
        "//modules/common/data:global_flagfile",
    ],
    deps = [
        "//external:gflags",
    ],
)
