import ScadeKit

class FusionUtilsDemo: SCDApplication {
  let window = SCDLatticeWindow()
  let mainAdapter = MainPageAdapter()
  
  override func onFinishLaunching() {
  #if os(iOS)
  mainAdapter.rootView = self.rootView
    #endif
    mainAdapter.load("main.page")
    mainAdapter.show(view: window)
  }
}
