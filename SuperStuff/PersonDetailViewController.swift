//
//  PersonDetailViewController.swift
//  SuperStuff
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var person: Person!
    var imageFetcher: (() -> ())!
    
    var image: UIImage! {
        didSet {
            imageView.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageFetcher()
        nameLabel.text = person.login
    }
}
