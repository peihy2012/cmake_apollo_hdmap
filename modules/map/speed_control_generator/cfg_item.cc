#include "cfg_item.h"
#include "modules/common/util/file.h"

CfgItem::CfgItem() {
}
CfgItem::~CfgItem() {
}
 
bool CfgItem::Init(const string &str) {
  if (str.empty()) {
    printf("[ERROR]: str is empty\n");
    return false;
  } 
    
  cJSON *root = cJSON_Parse(str.c_str());
  if (!root) {
    printf("[ERROR]: parse root failed!");
    return false;
  } 

  cJSON *name = cJSON_GetObjectItem(root, "name");
  if (!name) {
    printf("[ERROR]: parse value failed! key = name\n");
    cJSON_Delete(root);    
    return false;
  }
  name_ = name->valuestring;

  if (!get_value (root, "start", start_)) {
    cJSON_Delete(root);
    return false;
  }
  if (!get_value (root, "interval", interval_)) {
    cJSON_Delete(root);
    return false;
  }
  if (!get_value (root, "v", v_)) { 
    cJSON_Delete(root);
    return false;
  }
  cJSON_Delete(root);
  return true;

}

bool CfgItem::get_value(cJSON *root, const std::string &str, double &value) {
  if (!root || str.empty()) {
    printf("[ERROR]: get value failed! key = <%s>\n", str.c_str());
    return false;
  }
  cJSON *json = cJSON_GetObjectItem(root, str.c_str());
  if (!json) {
    printf("[ERROR]: parse value failed! key = <%s>\n", str.c_str());
    return false;
  }
  value = json->valuedouble;
  return true;
}

bool CfgItem::get_v(double s, double &v) {
  if (s >= start_ && s <= (start_ + interval_)) {
    v = v_;
    return true;
  } else 
    return false;
  return false;
}

bool CfgItem::generator_control(SpeedControls &sc_list, const SmoothMgr &sm) {
  const vector<SmoothItem> &s_list = sm.get_vector();

  SpeedControl *sc = sc_list.add_speed_control();
  sc->set_name(name_.c_str());
  bool exist = false;
   
  for (size_t i = 0; i< s_list.size(); i++) {
    if (s_list[i].get_s() >= start_ && s_list[i].get_s() <= (start_ + interval_)) {
      exist = true;
      apollo::common::PointENU *point = sc->mutable_polygon()->add_point(); 
      point->set_x(s_list[i].get_x());
      point->set_y(s_list[i].get_y());
      point->set_z(0.0);
    }
  }
  if (exist) {
    sc->set_name(name_.c_str());
    sc->set_speed_limit(v_);
  }
  return true;
}
