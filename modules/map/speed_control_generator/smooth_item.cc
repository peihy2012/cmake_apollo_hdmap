#include "smooth_item.h"

SmoothItem::SmoothItem() {
}
SmoothItem::~SmoothItem() {
}

bool SmoothItem::Init(const char *str) {
  if (!str) {
    printf("[ERROR]: str is empty\n");
    return false;
  }

  cJSON *root = cJSON_Parse(str);
  if (!root) {
    printf("[ERROR]: parse root failed! str = <%s>\n", str);
    return false;
  }
  if (!get_value (root, "kappa", kappa_)) {
    cJSON_Delete(root);
    return false;
  }
  if (!get_value (root, "s", s_)) {
    cJSON_Delete(root);
    return false;
  }
  if (!get_value (root, "theta", theta_)) {
    cJSON_Delete(root);
    return false;
  }
  if (!get_value (root, "x", x_)) {
    cJSON_Delete(root);
    return false;
  }
  if (!get_value (root, "y", y_)) {
    cJSON_Delete(root);
    return false;
  }
  if (!get_value (root, "dkappa", dkappa_)) {
    return false;
  }
  cJSON_Delete(root);
  return true;

}

bool SmoothItem::get_value(cJSON *root, const std::string &str, double &value) {
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
