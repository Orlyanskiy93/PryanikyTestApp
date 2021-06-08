//
//  ViewController.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import UIKit

class MainViewController: UIViewController, MainViewInput {
    @IBOutlet weak var tableView: UITableView!
    private var output: MainViewOutput!
    private lazy var displayManager: MainDisplayManager = {
        let displpayManager = MainDisplayManager(tableView)
        return displpayManager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = MainPresenter(view: self)
        output.viewIsReady()
    }
    
    func setupInitialState() {
        displayManager.delegate = self
    }
    
    func didRecived(_ pryanikObjects: [PryanikObject]) {
        displayManager.pryanikObjects = pryanikObjects
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = displayManager.tableView.indexPathForSelectedRow else {
            return
        }
        let pryanikObject = displayManager.pryanikObjects[indexPath.row]
        if let detailsVC = segue.destination as? DetailsViewController {
            detailsVC.pryanikObject = pryanikObject
        }
    }

}

extension MainViewController: MainDisplayManagerDelegate {
    func mainDisplayManager(_ stockListDisplayManager: MainDisplayManager, didSelectPryanikObject pryanikObject: PryanikObject) {
        performSegue(withIdentifier: "detailsSegue", sender: .none)
    }
}
