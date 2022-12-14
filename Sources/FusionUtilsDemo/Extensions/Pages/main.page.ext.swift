import ScadeKit

extension MainPageAdapter {
  var share_btn: SCDWidgetsButton {
    return self.page?.getWidgetByName("share_btn") as! SCDWidgetsButton
  }

  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }

  var pay_btn: SCDWidgetsButton {
    return self.page?.getWidgetByName("pay_btn") as! SCDWidgetsButton
  }
}