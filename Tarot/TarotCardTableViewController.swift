//
//  TarotCardTableViewController.swift
//  Tarot
//
//  Created by Priscilla Jofani Oetomo on 10/17/17.
//  Copyright © 2017 grandevox. All rights reserved.
//

import Foundation
import UIKit

// Our table view controller now implements the UISearchResultsUpdating protocol that enables
// it to implement the search bar.
class TarotCardTableViewController: UITableViewController
{
    // Get a reference to our model so we can get our deck of cards
    // Note here we are instantiating a new model, not best practice as we have already done
    // this in our app in our main view controller, later we will look at solving this issue.
    
    var tarot = Model().deckOfCards.naturalOrder()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tarot List"
        
    }
    
    // UITableviewController function for determining how many rows are needed to hold the data from our model
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tarot.count
    }
    
    // UITableviewController function for determining what to display in each row of the table
    // this function is called for every row in the table as determined by the previous overidden function
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        // check which data source should be used for loading up each row in the table.
        let card : MajorArcanaCard = tarot[indexPath.item]
        
        // Configure the cell
        cell?.textLabel!.text = card.name
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell!
        
    }
}


