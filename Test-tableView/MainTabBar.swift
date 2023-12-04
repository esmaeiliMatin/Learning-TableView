import UIKit

class MainTabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        
        let homePage = UIViewController()
        homePage.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let orderListPage = OrderListController()
        orderListPage.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(systemName: "list.dash.header.rectangle"), tag: 1)
        
        let cartPage = UIViewController()
        cartPage.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 2)
        
        let settingsPage = SettingsView()
        settingsPage.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), tag: 3)
        
        viewControllers = [homePage, orderListPage, cartPage, settingsPage]
        
        let appearance = UITabBarItem.appearance()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 14.0)
        ]
        self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        appearance.setTitleTextAttributes(attributes, for: .normal)
        selectedIndex = 1
        
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 6)
    }
}
