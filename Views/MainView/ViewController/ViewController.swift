import UIKit
import SwiftUI
import ReSwift

class ViewController: UIViewController, Coordinating {
    private let reduxObserver: StoreObserver
    var coordinator: MainCoordinator?
    
    init(reduxObserver: StoreObserver) {
        self.reduxObserver = reduxObserver
        super.init(nibName: nil, bundle: nil)
        MainStore.dispatch(ApiRequestAction())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftUIView = ContentView(storeObserver: reduxObserver, coordinator: self.coordinator)

        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.edgesForExtendedLayout = .all
        hostingController.view.frame = view.bounds

        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
    }
    


}

