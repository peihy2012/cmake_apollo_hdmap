
package(default_visibility = ["//visibility:public"])

cc_library(
    name = "math",
    deps = [
        ":angle",
        ":cartesian_frenet_conversion",
        ":euler_angles_zxy",
        ":factorial",
        ":geometry",
        ":integral",
        ":kalman_filter",
        ":linear_interpolation",
        ":lqr",
        ":quaternion",
        ":search",
        ":sin_table",
    ],
)

cc_library(
    name = "geometry",
    srcs = [
        "aabox2d.cc",
        "box2d.cc",
        "line_segment2d.cc",
        "math_utils.cc",
        "math_utils.h",
        "polygon2d.cc",
        "vec2d.cc",
    ],
    hdrs = [
        "aabox2d.h",
        "aaboxkdtree2d.h",
        "box2d.h",
        "line_segment2d.h",
        "polygon2d.h",
        "vec2d.h",
    ],
    deps = [
        "//modules/common:log",
        "//modules/common/util:string_util",
    ],
)

cc_library(
    name = "sin_table",
    srcs = [
        "sin_table.cc",
    ],
    hdrs = [
        "sin_table.h",
    ],
)

cc_library(
    name = "angle",
    srcs = [
        "angle.cc",
    ],
    hdrs = [
        "angle.h",
    ],
    deps = [
        ":sin_table",
    ],
)

cc_library(
    name = "euler_angles_zxy",
    hdrs = [
        "euler_angles_zxy.h",
    ],
    deps = [
        ":geometry",
        "@eigen",
    ],
)

cc_library(
    name = "quaternion",
    hdrs = [
        "quaternion.h",
    ],
    deps = [
        ":euler_angles_zxy",
        ":geometry",
        "//modules/common/proto:common_proto",
        "@eigen",
    ],
)

cc_library(
    name = "matrix_operations",
    srcs = [
        "matrix_operations.cc",
    ],
    hdrs = [
        "matrix_operations.h",
    ],
    deps = [
        "@eigen",
        "//modules/common:log",
    ],
)

cc_library(
    name = "kalman_filter",
    hdrs = [
        "kalman_filter.h",
    ],
    deps = [
        "//modules/common:log",
        "//modules/common/math:matrix_operations",
        "@eigen",
    ],
)

cc_library(
    name = "extended_kalman_filter",
    hdrs = [
        "extended_kalman_filter.h",
    ],
    deps = [
        "//modules/common:log",
        "//modules/common/math:matrix_operations",
        "@eigen",
    ],
)

cc_library(
    name = "factorial",
    hdrs = [
        "factorial.h",
    ],
    deps = [
    ],
)

cc_library(
    name = "path_matcher",
    srcs = [
        "path_matcher.cc",
    ],
    hdrs = [
        "path_matcher.h",
    ],
    deps = [
        "//modules/common/math:linear_interpolation",
        "//modules/common/proto:pnc_point_proto",
    ],
)

cc_library(
    name = "search",
    srcs = [
        "search.cc",
    ],
    hdrs = [
        "search.h",
    ],
    deps = [
    ],
)

cc_library(
    name = "linear_interpolation",
    srcs = [
        "linear_interpolation.cc",
    ],
    hdrs = [
        "linear_interpolation.h",
    ],
    deps = [
        ":geometry",
        "//modules/common/proto:pnc_point_proto",
    ],
)

cc_library(
    name = "nonlinear_interpolation",
    srcs = [
        "nonlinear_interpolation.cc",
    ],
    hdrs = [
        "nonlinear_interpolation.h",
    ],
    deps = [
        ":geometry",
        ":hermite_spline",
        ":integral",
        "//modules/common/proto:pnc_point_proto",
    ],
)

cc_library(
    name = "integral",
    srcs = [
        "integral.cc",
    ],
    hdrs = [
        "integral.h",
    ],
    deps = [
        "//modules/common:log",
    ],
)

cc_library(
    name = "lqr",
    srcs = [
        "linear_quadratic_regulator.cc",
    ],
    hdrs = [
        "linear_quadratic_regulator.h",
    ],
    deps = [
        "//modules/common:log",
        "@eigen",
    ],
)


cc_library(
    name = "cartesian_frenet_conversion",
    srcs = [
        "cartesian_frenet_conversion.cc",
    ],
    hdrs = [
        "cartesian_frenet_conversion.h",
    ],
    deps = [
        ":geometry",
        "//modules/common:log",
        "@eigen",
    ],
)

cc_library(
    name = "hermite_spline",
    hdrs = [
        "hermite_spline.h",
    ],
    deps = [
        "//modules/common:log",
    ],
)

