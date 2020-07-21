#include "scg_cfg.h"
#include <fstream>
#include "modules/map/proto/map_speed_control.pb.h"
#include "modules/common/util/file.h"

typedef apollo::hdmap::SpeedControl SpeedControl;
typedef apollo::hdmap::SpeedControls SpeedControls;


ScgCfg::ScgCfg() {
}
ScgCfg::~ScgCfg() {
}
 
bool ScgCfg::Init(const string &cfg_file, const std::string &output) {
  output_file_ = output;
  ifstream filestr;

  filestr.open(cfg_file.c_str(), ios::in);
  if (!filestr) {
    printf("[ERROR]: Open file <%s> failed!\n", cfg_file.c_str());
    return false;
  }

  char str_item[1024] = {0};
  while (filestr.getline(str_item,1024)) {
    CfgItem item;
    item.Init(str_item);
    cfg_list_.push_back(item);
  } 
  filestr.close();
  return true;
}


bool ScgCfg::generator_control(const SmoothMgr &smooth_mgr) {
  SpeedControls sc_list;
  for (size_t i = 0; i< cfg_list_.size(); i++) {
   cfg_list_[i].generator_control(sc_list,smooth_mgr); 
  }

 return apollo::common::util::SetProtoToASCIIFile(sc_list, output_file_);
}
