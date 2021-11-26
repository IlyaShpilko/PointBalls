//
//  DetailViewController.swift
//  PointsBalls
//
//  Created by Ilya Shpilko on 11/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    // FIXME: - Скрывать экран при нажатии за пределы
    
    @IBOutlet private weak var productLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    var product: String?
    var price: String?
    var score: String?
    
    // MARK: - Life Cycle View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productLabel.text = product
        priceLabel.text = price
        scoreLabel.text = score
    }
    
    // MARK: - Action
    @IBAction func closeButton(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
