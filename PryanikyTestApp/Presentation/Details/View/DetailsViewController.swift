//
//  DetailsViewController.swift
//  PryanikyTestApp
//
//  Created by Дмитрий Орлянский on 08.06.2021.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController, DetailsViewInput {
    private var output: DetailsViewOutput!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    var pryanikObject: PryanikObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = DetailsPresenter(view: self)
        output.viewIsReady()
    }
    
    func setupInitialState() {
        nameLabel.text = pryanikObject.name
        textLabel.text = pryanikObject.text
        if let urlString = pryanikObject.imageUrlString {
            let url = URL(string: urlString)!
            imageView.kf.setImage(with: url)
        }
    }
}
