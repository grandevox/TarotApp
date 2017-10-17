//
//  Model.swift
//  Tarot
//
//  Created by Priscilla Jofani Oetomo on 10/17/17.
//  Copyright © 2017 grandevox. All rights reserved.
//

import Foundation

class Model
{
//    let majorArcanaCards = ["Fool" : "Go forth with faith.",
//                            "Magician" : "Magic is on your side.",
//                            "HighPriestess" : "A powerful woman will be part of the solution.",
//                            "Empress" : "Plant the seed and it will grow.",
//                            "Emperor" : "You will need to be well organised.",
//                            "Heirophant" : "A powerful man will be part of the solution.",
//                            "Lovers" : "You cannot do this alone.",
//                            "Chariot" : "You need to find the right vehicle to achieve the outcome.",
//                            "Justice" : "If you have been fair in your dealings with others, you have nothing to be concerned about.",
//                            "Hermit" : "This is not the time to take action, but more study and reflection is required.",
//                            "WheelOfFortune" : "The outcome has already been decided.",
//                            "Strength" : "You have the skills and abilities required to pull this off.",
//                            "HangedMan" : "Try looking at the situation from another perspective.",
//                            "Death" : "You must finish something first, before you can move forward.",
//                            "Temperance" : "A balanced approach is need for a successful outcome.",
//                            "Devil" : "The devil is in the details, make sure you have made every effort for success.",
//                            "Tower" : "Something unexpected will happen that will resolve the situation.",
//                            "Star" : "Look to the stars, you will find your answer.",
//                            "Moon" : "The answer is not known at this time, please ask again later.",
//                            "Sun" : "Relax, it is done.",
//                            "Judgement" : "Be discerning and consult others before making a decision.",
//                            "World" : "The result you are looking for has already happened." ]
    
    let majorArcanaCards:[String: MajorArcanaCard]
    var currentCard:MajorArcanaCard = MajorArcanaCard.fool
    var deckOfCards:DeckOfCards
    
    var currentCardImageName = "";
    
    // Populate the model with a set of Major Arcana Cards
    init() {
        majorArcanaCards = MajorArcanaCard.createDeck()
        deckOfCards = DeckOfCards()
    }
    
    /* Here we use a Struct to hold the instance of the model i.e itself*/
    private struct Static
    {
        static var instance: Model?
    }
    /* This is a class variable allowing me to access it without first instantiating the model Now we can retrieve the model without instantiating it directly var model = Model.sharedInstance */
    class var sharedInstance: Model
    {
        if !(Static.instance != nil)
        {
            Static.instance = Model()
        }
        return Static.instance!
    }
    
    // Return the oracles response to the question posed by the user
    func respond()->String
    {
        // Returns a random integer within the range of indexes for the answers array
        let response: Int = Int(arc4random_uniform(UInt32(majorArcanaCards.count)))
        
//        // Convert the values in the dictionary to an Array and retrieve the value at the specified index
//        let message = Array(majorArcanaCards.values)[response]
//        
//        // Set the current card name based on the specified index
//        currentCardImageName = Array(majorArcanaCards.keys)[response] 

        currentCard = Array(majorArcanaCards.values)[response]
        return currentCard.interpretation
        
//        return message
    }
    
//    // Return the Oracle's response to the question posed by the user
//    func respond(cardImageName:inout String, message:inout String)
//    {
//        // Returns a random integer within the range of indexes for the answers array
//        let response: Int = Int(arc4random_uniform(UInt32(majorArcanaCards.count)))
//        
//        // Convert the values in the dictionary to an Array and retrieve the value
//        // at the specified index
//        message = Array(majorArcanaCards.values)[response]
//        
//        // Set the current card name based on the specified index
//        cardImageName = Array(majorArcanaCards.keys)[response]
//    }
//    
//    // Return the oracles response to the question posed by the user
//    func respond()-> (cardImageName: String, cardMessage:String)
//    {
//        // Returns a random integer within the range of indexes for the answers array
//        let response: Int = Int(arc4random_uniform(UInt32(majorArcanaCards.count)))
//        
//        // Convert the values in the dictionary to an Array and retrieve the value at
//        // the specified index
//        let cardMessage = Array(majorArcanaCards.values)[response]
//        
//        // Set the current card name based on the specified index
//        let cardImageName = Array(majorArcanaCards.keys)[response]
//        
//        // This returns the two values in a tuple
//        return (cardImageName, cardMessage)
//    }
}
