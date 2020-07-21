#ifndef _CFG_ITEM_H_
#define _CFG_ITEM_H_

#include <string>
#include "smooth_mgr.h"
#include "modules/map/proto/map_speed_control.pb.h"
#include "cJSON.h"
using namespace std;

typedef apollo::hdmap::SpeedControl SpeedControl;
typedef apollo::hdmap::SpeedControls SpeedControls;

class CfgItem {
 public:
  CfgItem();
  ~CfgItem();

 public:
  bool Init(const string &str);
  bool get_v(double s, double &v);
  bool generator_control(SpeedControls &sc_list, const SmoothMgr &sm);

 private:
  bool get_value(cJSON *root, const std::string &str, double &value);

 private:
  std::string name_;
  double start_;
  double interval_;
  double v_;
};

#endif
