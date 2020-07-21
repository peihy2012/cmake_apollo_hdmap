#ifndef _SCG_CFG_H_
#define _SCG_CFG_H_

#include <string>
#include <vector>
#include "smooth_mgr.h"
#include "cfg_item.h"
#include "cJSON.h"

using namespace std;

class ScgCfg {
 public:
  ScgCfg() ;
  ~ScgCfg();

 public:
  bool Init(const string &cfg_file, const std::string &output);
  
  bool get_speed_limit(double s, double &v);

  bool generator_control(const SmoothMgr &smooth_mgr);

 private:
  vector<CfgItem> cfg_list_; 
  std::string output_file_;
};

#endif

