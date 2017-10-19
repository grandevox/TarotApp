//
//  TarotCardDetailViewController.swift
//  Tarot
//
//  Created by Priscilla Jofani Oetomo on 10/19/17.
//  Copyright © 2017 grandevox. All rights reserved.
//

import UIKit

class TarotCardDetailViewController: UIViewController {
    
    /* this property is so it can receive the name of the image
     it needs to display from the MasterTableViewController
     */
    var cardName:String?
    var currentCard: MajorArcanaCard?
    
    @IBOutlet weak var image: UIImageView!
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Set the inital card image to the fool
        image.image = UIImage(named: (currentCard?.imageName)!)
        print("")
    }
    
    // Lifecycle method for clearing up memory resources
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TarotCardDetailViewController: Refresh {
    func refresh(card: MajorArcanaCard) {
        self.cardName = card.name
        let imageName = card.name.replacingOccurrences(of: " ", with: "")
        image.image = UIImage(named: imageName)
    }
}
