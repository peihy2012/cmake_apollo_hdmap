
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "util",
    srcs = [
        "file.cc",
        "string_tokenizer.cc",
        "util.cc",
    ],
    hdrs = [
        "blocking_queue.h",
        "file.h",
        "string_tokenizer.h",
        "util.h",
    ],
    linkopts = [
        "-lboost_filesystem",
    ],
    deps = [
        ":string_util",
        "//modules/common/math",
        "//modules/common/proto:pnc_point_proto",
        "//modules/common/time",
        "//modules/perception/proto:perception_proto",
    ],
)



cc_library(
    name = "disjoint_set",
    hdrs = ["disjoint_set.h"],
)


cc_library(
    name = "lru_cache",
    hdrs = ["lru_cache.h"],
)

cc_library(
    name = "color",
    hdrs = ["color.h"],
)

cc_library(
    name = "string_util",
    srcs = [
        "string_util.cc",
    ],
    hdrs = [
        "string_util.h",
    ],
    deps = [
        "@com_google_protobuf//:protobuf",
    ],
)


cc_library(
    name = "map_util",
    hdrs = ["map_util.h"],
    deps = [
        "@com_google_protobuf//:protobuf",
    ],
)



cc_library(
    name = "factory",
    hdrs = [
        "factory.h",
    ],
    deps = [
        "//modules/common:log",
    ],
)




cc_library(
    name = "points_downsampler",
    hdrs = [
        "points_downsampler.h",
    ],
    deps = [
        "//modules/common:log",
        "//modules/common/math:geometry",
    ],
)


cc_library(
    name = "json_util",
    srcs = [
        "json_util.cc",
    ],
    hdrs = [
        "json_util.h",
    ],
    deps = [
        "//modules/common:log",
        "//third_party/json",
        "@com_google_protobuf//:protobuf",
    ],
)


cc_library(
    name = "http_client",
    srcs = ["http_client.cc"],
    hdrs = ["http_client.h"],
    deps = [
        "//modules/common:log",
        "//modules/common/status",
        "//modules/common/util:string_util",
        "//third_party/json",
        "@curlpp",
    ],
)

cc_library(
    name = "thread_pool",
    hdrs = [
        "thread_pool.h",
    ],
    srcs = [
        "thread_pool.cc",
    ],
    deps = [
        "//modules/common:macro",
        "@ctpl",
    ],
)

