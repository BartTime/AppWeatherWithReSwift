import UIKit
import SwiftUI

class SecondViewController: UIViewController, Coordinating {
    
    var coordinator: DetailCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var swiftUIView = AllCityContentView()
        
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.edgesForExtendedLayout = .all
        hostingController.view.frame = view.bounds
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }

}
