#ifndef _SMOOTH_ITEM_H_
#define _SMOOTH_ITEM_H_

#include <string>
#include "cJSON.h"

class SmoothItem {
 public:
  SmoothItem();
  ~SmoothItem();

 public:
  bool Init(const char *str);
  double get_s() const { return s_;}
  double get_x() const { return x_;}
  double get_y() const { return y_;}

 private:
  bool get_value(cJSON *root, const std::string &str, double &value);
 private:
  double kappa_;
  double s_;
  double theta_;
  double x_;
  double y_;
  double dkappa_;
};
#endif
