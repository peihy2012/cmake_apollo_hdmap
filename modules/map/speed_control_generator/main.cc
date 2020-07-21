#include <iostream>
#include "smooth_mgr.h"
#include "scg_cfg.h"
#include "modules/map/proto/map_speed_control.pb.h"

int main(int argc, char *argv[]) {
  if (argc < 3) {
    printf("[ERROR]: Invalid params!\n\tUseful: scg [smooth_file] [speed_control_file] [cfg_file]\n");
    return 1;
  }
  
  SmoothMgr smgr;
  std::string smooth_file(argv[1]);
  if(!smgr.Init(smooth_file)) {
    printf("[ERROR]: smooth read data failed\n");
    return 1;
  }

  std::string speed_control_file(argv[2]);
  std::string cfg_file(argv[3]);
  ScgCfg cfg;
  if (!cfg.Init(cfg_file, speed_control_file)) {
    printf("[ERROR]: generate speed control file init failed\n");
    return 1;
  }
  
  if (!cfg.generator_control(smgr)) {
    printf("[ERROR]: generate speed control file failed\n");
    return 1;
  }

  return 0;
};


