//
//  DeckOfCards.swift
//  Tarot
//
//  Created by Priscilla Jofani Oetomo on 10/17/17.
//  Copyright © 2017 grandevox. All rights reserved.
//

import Foundation

struct DeckOfCards
{
    // Stored properties
    var deckOfCards:[MajorArcanaCard]
    var tabledCards:[MajorArcanaCard]
    
    init()
    {
        // Create an array populate with one of each card
        deckOfCards = MajorArcanaCard.getDeck()
        // Create an empty array of Major Arcana Cards
        tabledCards = [MajorArcanaCard]()
        
        shuffle()
        
        tableACard()
        
        putCardsBackInDeck()
        
        print("")
    }
    
    mutating func shuffle()
    {
        // Perform the swap operation equal to the number of cards in the deck
        for currentCardIndex in 0..<deckOfCards.count
        {
            // Random number between 0 and the number of cards in deck
            let randomCardIndex = Int(arc4random_uniform(UInt32(deckOfCards.count)))
            
            // Check that we are not swapping a card with itself
            if randomCardIndex != currentCardIndex
            {
                // Swap the current card with a random card
                swap(&deckOfCards[currentCardIndex], &deckOfCards[randomCardIndex])
            }
        }
    }
    
    mutating func tableACard()
    {
        // Remove the top or first card from the deck
        let card = deckOfCards.remove(at: 0)
        
        // Place this card into the array of tabled cards
        tabledCards.append(card)
    }
    
    mutating func putCardsBackInDeck()
    {
        for card in 0..<tabledCards.count
        {
            // Remove card from top of tabled cards
            let card = tabledCards.remove(at: card)
            
            // Random number between 0 and the number of cards in deck
            let randomCardIndex = Int(arc4random_uniform(UInt32(deckOfCards.count)))
            
            // Insert card back into deck of cards at random position
            deckOfCards.insert(card, at: randomCardIndex)
        }
    }
    
    mutating func naturalOrder()->[MajorArcanaCard]
    {
        let deckOfCards:[MajorArcanaCard] = MajorArcanaCard.getDeck()
        return deckOfCards
    }
}
