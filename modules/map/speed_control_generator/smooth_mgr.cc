#include "smooth_mgr.h"
#include <fstream>


SmoothMgr::SmoothMgr() {
}

SmoothMgr::~SmoothMgr() {
}

bool SmoothMgr::Init(const std::string &smooth_file) {
  ifstream filestr;

  filestr.open(smooth_file.c_str(), ios::binary);
  if (!filestr) {
    printf("[ERROR]: Open file <%s> failed!\n", smooth_file.c_str());
    return false;
  }

  char str_item[1024] = {0};
  while (filestr.getline(str_item,1024)) {
    SmoothItem item;
    item.Init(str_item);
    item_list_.push_back(item);
  } 
  filestr.close();
  return true;
}
