# RootTabBarController
自定义tabbar controller （非组件话， 由于每个人的项目的差异，个人不建议这种东西封装成组件）
- 自定义 tabbar controller
- 一键调用， 快速集成，三种点击Item 点击动画 ，支持自定义样式，颜色， 导航栏自定义。
- 另外自编 滚动切换页面 视图，摆脱三方框架，不可控因素。

## | ScreenRecording  |

![Recordings](https://github.com/shiliujiejie/RootTabBarController/blob/master/CustomrootTab.gif) |![Recording](https://github.com/shiliujiejie/RootTabBarController/blob/master/ScreenRecording_Normal.gif) | ![Recordings](https://github.com/shiliujiejie/RootTabBarController/blob/master/ScreenRecording_center.gif) | 


## | USE  |

    class ViewController: UIViewController {

       override func viewDidLoad() {
       super.viewDidLoad()
       configTabBar()

    }

     private func configTabBar() {

        let tabBarNormalImages = ["Main_N","book_N","task_N","acount_N"]
        let tabBarSelectedImages = ["Main_S","book_S","task_S","acount_S"]
        let tabBarTitles = ["首页","消息","发现","我的"]
        
        let rootModel1 = RootTabBarModel.init(title: tabBarTitles[0], imageNormal: tabBarNormalImages[0], imageSelected: tabBarSelectedImages[0], controller: MainController())

        let rootModel2 = RootTabBarModel.init(title: tabBarTitles[1], imageNormal: tabBarNormalImages[1], imageSelected: tabBarSelectedImages[1], controller: MsgController())

        let rootModel3 = RootTabBarModel.init(title: tabBarTitles[2], imageNormal: tabBarNormalImages[2], imageSelected: tabBarSelectedImages[2], controller: FindController())

        let rootModel4 = RootTabBarModel.init(title: tabBarTitles[3], imageNormal: tabBarNormalImages[3], imageSelected: tabBarSelectedImages[3], controller: MineController())
        
        let tabBars =  [rootModel1, rootModel2, rootModel3, rootModel4]
        let tabbarVC = RootTabBarViewController.init(config: getConfigModel(), tabBars: tabBars)
        self.addChild(tabbarVC)
        self.view.addSubview(tabbarVC.view)
        //  window?.rootViewController = tabbarVc
     }

    /// 定制 tabbar 和 navgationBar 样式
    ///
    /// - Returns: RootTabBarConfig 对象
    
    private func getConfigModel() -> RootTabBarConfig {
    
       let rootConfig = RootTabBarConfig()
       
       /// center -> 中间凸出按钮  normal -> 常规样式
       rootConfig.tabBarStyle = .normal
       
       /// 是否 点击  动画
       rootConfig.isAnimation = true
       
       /// 点击 动画类型 scaleDown：小-大     rotation： 旋转
       rootConfig.animation = .scaleDown
       
       /// 中心按钮j 上浮高度
       rootConfig.centerInsetUp = 0
       
       rootConfig.tabBarBackgroundColor = UIColor(white: 0.98, alpha: 0.99)
       
       rootConfig.navBarBackgroundColor = UIColor(white: 0.98, alpha: 0.99)
       
       rootConfig.tabBarShadowColor = UIColor.groupTableViewBackground

       return rootConfig
    }


    }
