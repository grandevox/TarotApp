//
//  TarotCardTableViewController.swift
//  Tarot
//
//  Created by Priscilla Jofani Oetomo on 10/17/17.
//  Copyright © 2017 grandevox. All rights reserved.
//

import Foundation
import UIKit

protocol Refresh {
    func refresh(card: MajorArcanaCard)
}

// Our table view controller now implements the UISearchResultsUpdating protocol that enables
// it to implement the search bar.
class TarotCardTableViewController: UITableViewController, UISearchResultsUpdating
{
    // Get a reference to our model so we can get our deck of cards
    // Note here we are instantiating a new model, not best practice as we have already done
    // this in our app in our main view controller, later we will look at solving this issue.
    
    var tarot = Model.sharedInstance.deckOfCards.naturalOrder()
    var filteredTarotCards = [MajorArcanaCard]()
    let searchController = UISearchController(searchResultsController: nil)
    var currentCard: MajorArcanaCard?
    var delegate: Refresh?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tarot List"
        
        // Sets up this class as the Search controller and creates the search bar at the top of the table view
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
    }
    
    // UITableviewController function for determining how many rows are needed to hold the data from our model
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // If something has been typed in search bar, then use the filtered arrays as the data source
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredTarotCards.count
        }
        
        return tarot.count
    }
    
    // UITableviewController function for determining what to display in each row of the table
    // this function is called for every row in the table as determined by the previous overidden function
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell     {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        
        // check which data source should be used for loading up each row in the table.
        let card : MajorArcanaCard = changeDataSource(indexPath: indexPath as NSIndexPath)
        
        // Configure the cell
        cell?.textLabel!.text = card.name
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentCard = self.tarot[indexPath.row]
        
        // This points to our detail View controller so we are setting the property on the detail view when we select a card in our master view
        self.delegate?.refresh(card: currentCard!)
        
        if let detailViewController = self.delegate as? TarotCardDetailViewController {
            splitViewController?.showDetailViewController(detailViewController.navigationController!, sender: nil)
        }
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?)
    {
        // Grab the current card
        let indexPath = self.tableView.indexPathForSelectedRow!
        let card : MajorArcanaCard = changeDataSource(indexPath: indexPath as NSIndexPath)
        
        // Set a property on the destination view controller
        let detailsVC = segue.destination as! TarotCardDetailViewController
        
        let destinationTitle = card.imageName
        detailsVC.title = destinationTitle
        detailsVC.cardName = destinationTitle;
    }
    
    func changeDataSource (indexPath: NSIndexPath) -> MajorArcanaCard {
        var card: MajorArcanaCard
        
        if searchController.isActive && searchController.searchBar.text != "" {
            card = filteredTarotCards[indexPath.row]
        } else {
            card = tarot[indexPath.row]
        }
        
        return card
    }
    
    // Method implemented by the protocol that is called when the search bar is being used for searching
    func updateSearchResults(for: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    // Searches the main data source for the search text to return a filtered result
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredTarotCards = tarot.filter {
            tarot in return tarot.name.lowercased().contains(searchText.lowercased())
        }
        
        // Reload the table data to display the filtered results
        tableView.reloadData()
    }
}


