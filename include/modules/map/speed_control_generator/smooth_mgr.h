#ifndef _SMOOTH_MGR_
#define _SMOOTH_MGR_

#include <vector>
#include <string>
#include "smooth_item.h"
using namespace std;

class SmoothMgr {
 public:
  SmoothMgr ();
  ~SmoothMgr ();

 public:
  bool Init(const std::string &smooth_file);
  const vector<SmoothItem> &get_vector() const {return item_list_;}

 private:
  vector<SmoothItem> item_list_;
};

#endif
