
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "hdmap",
    srcs = [
        "hdmap.cc",
        "hdmap_common.cc",
        "hdmap_impl.cc",
    ],
    hdrs = [
        "hdmap.h",
        "hdmap_common.h",
        "hdmap_impl.h",
        "hdmap_util.h",
    ],
    deps = [
        "//modules/common:macro",
        "//modules/common/configs:config_gflags",
        "//modules/common/math",
        "//modules/common/math:linear_interpolation",
        "//modules/common/util",
        "//modules/map/hdmap/adapter:opendrive_adapter",
        "//modules/map/proto:map_proto",
        "@glog//:glog",
    ],
)
