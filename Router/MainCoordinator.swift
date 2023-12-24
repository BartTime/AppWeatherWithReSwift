import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let reduxObserver = StoreObserver(initialState: MainStore.state)
        let mainVC = ViewController(reduxObserver: reduxObserver)
        let coordinator = MainCoordinator(navigationController: navigationController)
        mainVC.coordinator = coordinator
        navigationController.pushViewController(mainVC, animated: false)
    }
    
    func showDetail() {
        let detailCoordinator = DetailCoordinator(navigationController: navigationController)
        addChildCoordinator(detailCoordinator)
        detailCoordinator.start()
    }
    
}


class DetailCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let detailVC = SecondViewController()
        let coordinator = DetailCoordinator(navigationController: navigationController)
        detailVC.coordinator = coordinator
        navigationController.pushViewController(detailVC, animated: true)
    }

    func didFinish() {
        navigationController.popViewController(animated: true)
        removeChildCoordinator(self)
    }
}
