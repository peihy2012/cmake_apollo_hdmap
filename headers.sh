parent_path=$(cd `dirname $0`; pwd)

cd $parent_path

if [ ! -d "include" ];then
  mkdir include
else
  echo "dir include already exists"
fi
chmod +rw $parent_path/include

# LIB_LISTS="libhdmap.so"

PB_INCLUDES_FILES="
modules/map/relative_map/proto/relative_map_config.pb.h
modules/map/relative_map/proto/navigation.pb.h
modules/map/proto/map_signal.pb.h
modules/map/proto/map_crosswalk.pb.h
modules/map/proto/map_lane.pb.h
modules/map/proto/map_junction.pb.h
modules/map/proto/map_speed_bump.pb.h
modules/map/proto/map_parking_space.pb.h
modules/map/proto/map_id.pb.h
modules/map/proto/map_geometry.pb.h
modules/map/proto/map_clear_area.pb.h
modules/map/proto/map_road.pb.h
modules/map/proto/map_yield_sign.pb.h
modules/map/proto/map_stop_sign.pb.h
modules/map/proto/map_speed_control.pb.h
modules/map/proto/map_overlap.pb.h
modules/map/proto/map.pb.h
modules/common/vehicle_state/proto/vehicle_state.pb.h
modules/common/proto/vehicle_signal.pb.h
modules/common/proto/error_code.pb.h
modules/common/proto/scenario.pb.h
modules/common/proto/header.pb.h
modules/common/proto/pnc_point.pb.h
modules/common/proto/drive_state.pb.h
modules/common/proto/geometry.pb.h
modules/common/proto/drive_event.pb.h
modules/perception/proto/lane_post_process_config.pb.h
modules/perception/proto/tracker_config.pb.h
modules/perception/proto/perception_map_roi.pb.h
modules/perception/proto/low_object_filter_config.pb.h
modules/perception/proto/probabilistic_fusion_config.pb.h
modules/perception/proto/traffic_light_detection.pb.h
modules/perception/proto/perception_obstacle.pb.h
modules/perception/proto/sequence_type_fuser_config.pb.h
modules/perception/proto/hdmap_roi_filter_config.pb.h
modules/perception/proto/modest_radar_detector_config.pb.h
modules/perception/proto/yolo_camera_detector_config.pb.h
modules/perception/proto/perception_ultrasonic.pb.h
modules/perception/proto/async_fusion_config.pb.h
modules/perception/proto/cnn_segmentation_config.pb.h
modules/perception/proto/geometry_camera_converter_config.pb.h
modules/localization/proto/localization_config.pb.h
modules/localization/proto/measure.pb.h
modules/localization/proto/localization.pb.h
modules/localization/proto/sins_pva.pb.h
modules/localization/proto/pose.pb.h
modules/localization/proto/gnss_pnt_result.pb.h
modules/localization/proto/imu.pb.h
modules/localization/proto/odometry_lane_marker.pb.h
modules/localization/proto/gps.pb.h
modules/routing/proto/poi.pb.h
modules/routing/proto/routing.pb.h
modules/routing/proto/routing_config.pb.h
modules/routing/proto/topo_graph.pb.h
"

INCLUDES_FILES="
modules/map/relative_map/common/relative_map_gflags.h
modules/map/relative_map/relative_map.h
modules/map/relative_map/navigation_lane.h
modules/map/relative_map/relative_map_interface.h
modules/map/pnc_map/cuda_util.h
modules/map/pnc_map/path.h
modules/map/pnc_map/route_segments.h
modules/map/pnc_map/pnc_map.h
modules/map/hdmap/hdmap_impl.h
modules/map/hdmap/adapter/coordinate_convert_tool.h
modules/map/hdmap/adapter/xml_parser/header_xml_parser.h
modules/map/hdmap/adapter/xml_parser/junctions_xml_parser.h
modules/map/hdmap/adapter/xml_parser/roads_xml_parser.h
modules/map/hdmap/adapter/xml_parser/util_xml_parser.h
modules/map/hdmap/adapter/xml_parser/common_define.h
modules/map/hdmap/adapter/xml_parser/status.h
modules/map/hdmap/adapter/xml_parser/signals_xml_parser.h
modules/map/hdmap/adapter/xml_parser/lanes_xml_parser.h
modules/map/hdmap/adapter/xml_parser/objects_xml_parser.h
modules/map/hdmap/adapter/proto_organizer.h
modules/map/hdmap/adapter/opendrive_adapter.h
modules/map/hdmap/hdmap_common.h
modules/map/hdmap/hdmap_util.h
modules/map/hdmap/hdmap.h
modules/map/speed_control_generator/cJSON.h
modules/map/speed_control_generator/scg_cfg.h
modules/map/speed_control_generator/smooth_item.h
modules/map/speed_control_generator/smooth_mgr.h
modules/map/speed_control_generator/cfg_item.h
modules/common/transform_listener/transform_listener.h
modules/common/time/time.h
modules/common/time/time_util.h
modules/common/time/timer.h
modules/common/filters/mean_filter.h
modules/common/filters/digital_filter_coefficients.h
modules/common/filters/digital_filter.h
modules/common/macro.h
modules/common/configs/cpu_bind_helper.h
modules/common/configs/vehicle_config_helper.h
modules/common/configs/config_gflags.h
modules/common/vehicle_state/vehicle_state_provider.h
modules/common/util/string_util.h
modules/common/util/color.h
modules/common/util/map_util.h
modules/common/util/file.h
modules/common/util/factory.h
modules/common/util/json_util.h
modules/common/util/lru_cache.h
modules/common/util/thread_pool.h
modules/common/util/blocking_queue.h
modules/common/util/points_downsampler.h
modules/common/util/disjoint_set.h
modules/common/util/string_tokenizer.h
modules/common/util/util.h
modules/common/util/http_client.h
modules/common/adapters/message_adapters.h
modules/common/adapters/adapter_manager.h
modules/common/adapters/adapter_gflags.h
modules/common/adapters/adapter.h
modules/common/log.h
modules/common/math/quaternion.h
modules/common/math/math_utils.h
modules/common/math/nonlinear_interpolation.h
modules/common/math/aaboxkdtree2d.h
modules/common/math/search.h
modules/common/math/path_matcher.h
modules/common/math/aabox2d.h
modules/common/math/hermite_spline.h
modules/common/math/sin_table.h
modules/common/math/kalman_filter.h
modules/common/math/integral.h
modules/common/math/mpc_solver.h
modules/common/math/polygon2d.h
modules/common/math/extended_kalman_filter.h
modules/common/math/linear_interpolation.h
modules/common/math/factorial.h
modules/common/math/matrix_operations.h
modules/common/math/vec2d.h
modules/common/math/euler_angles_zxy.h
modules/common/math/cartesian_frenet_conversion.h
modules/common/math/line_segment2d.h
modules/common/math/angle.h
modules/common/math/box2d.h
modules/common/math/qp_solver/qp_solver_gflags.h
modules/common/math/qp_solver/active_set_qp_solver.h
modules/common/math/qp_solver/qp_solver.h
modules/common/math/linear_quadratic_regulator.h
modules/common/status/status.h
modules/routing/common/routing_gflags.h
modules/planning/common/planning_gflags.h
"

cd $parent_path
for INC in ${INCLUDES_FILES}; do
  SRC_PATH=${INC}
  cp --parents -rf ${INC} $parent_path/include
done

cd $parent_path/build
for INC in ${PB_INCLUDES_FILES}; do
  SRC_PATH=${INC}
  cp --parents -rf ${INC} $parent_path/include
done
