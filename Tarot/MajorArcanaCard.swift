//
//  MajorArcanaCard.swift
//  Tarot
//
//  Created by Priscilla Jofani Oetomo on 10/17/17.
//  Copyright © 2017 grandevox. All rights reserved.
//

import Foundation

enum MajorArcanaCard:Int
{
    case fool=1, magician, highPriestess, empress, emperor, heirophant, lovers, chariot, justice, hermit, wheelOfFortune, strength, hangedMan, death, temperance, devil, tower, star, moon, sun, judgement, world
    
    var rank:Int
        {
        get
        {
            return self.rawValue
        }
    }
    
    var name:String
        {
        get
        {
            switch self
            {
            case .fool: return "Fool"
            case .magician: return "Magician"
            case .highPriestess: return "High Priestess"
            case .empress: return "Empress"
            case .emperor: return "Emperor"
            case .heirophant: return "Heirophant"
            case .lovers: return "Lovers"
            case .chariot: return "Chariot"
            case .justice: return "Justice"
            case .hermit: return "Hermit"
            case .wheelOfFortune: return "Wheel of Fortune"
            case .strength: return "Strength"
            case .hangedMan: return "Hanged Man"
            case .death: return "Death"
            case .temperance: return "Temperance"
            case .devil: return "Devil"
            case .tower: return "Tower"
            case .star: return "Star"
            case .moon: return "Moon"
            case .sun: return "Sun"
            case .judgement: return "Judgement"
            case .world: return "World"
            default: return "Fool"
            }
        }
    }
    
    var hebrewLetter:Character
        {
        get
        {
            switch self
            {
            case .fool: return "א"
            case .magician: return "ב"
            case .highPriestess: return "ג"
            case .empress: return "ד"
            case .emperor: return "ה"
            case .heirophant: return "ו"
            case .lovers: return "ז"
            case .chariot: return "ח"
            case .justice: return "ט"
            case .hermit: return "י"
            case .wheelOfFortune: return "כ"
            case .strength: return "ל"
            case .hangedMan: return "מ"
            case .death: return "נ"
            case .temperance: return "ס"
            case .devil: return "ע"
            case .tower: return "פ"
            case .star: return "צ"
            case .moon: return "ק"
            case .sun: return "ר"
            case .judgement: return "ש"
            case .world: return "ת"
            default: return "א"
            }
        }
    }
    
    var imageName:String
        {
        get
        {
            return self.name.replacingOccurrences(of: " ", with: "")
        }
    }
    var interpretation:String
        {
        get
        {
            switch self
            {
            case .fool: return "Go forth with faith."
            case .magician: return "Magic is on your side."
            case .highPriestess: return "A powerful women will be part of the solution."
            case .empress: return "Plant the seed and it will grow."
            case .emperor: return "You will need to be well organised."
            case .heirophant: return "A powerful man will be part of the solution."
            case .lovers: return "You cannot do this alone."
            case .chariot: return "You need to find the right vehicle to achieve the outcome."
            case .justice: return "If you have been fair in your dealings with others, you have nothing to be concerned about. If you have not been fair in your dealings with other, make restitution before proceeding."
            case .hermit: return "This is not the time to take action, but more study and reflection is required."
            case .wheelOfFortune: return "The outcome has already been decided."
            case .strength: return "You have the skills and abilities required to pull this off."
            case .hangedMan: return "Try looking at the situation from another perspective."
            case .death: return "You must finish something first, before you can move forward."
            case .temperance: return "A balanced approach is need for a successful outcome."
            case .devil: return "The devil is in the details, make sure you have made every effort for success."
            case .tower: return "Something unexpected will happen that will resolve the situation."
            case .star: return "Look to the stars, you will find your answer."
            case .moon: return "The answer is not known at this time, please ask again later."
            case .sun: return "Relax, it is done."
            case .judgement: return "Be discerning and consult others before making a decision."
            case .world: return "The result you are looking for has already happened."
            default: return "Go forth with faith."
            }
        }
    }
    // This is a convienience method that enables me to return an array of cards
    static func getDeck() ->[MajorArcanaCard]
    {
        return [fool, magician, highPriestess, empress, emperor, heirophant,
                lovers, chariot, justice, hermit, wheelOfFortune, strength,
                hangedMan, death, temperance, devil, tower, star, moon, sun,
                judgement, world]
    }
    
    // This is a convienience method that enables me to return a dictionary of cards
    static func createDeck() ->[String:MajorArcanaCard]
    {
        // Create a dictionary object to return to the caller
        var majorArcana:[String:MajorArcanaCard] = [:]
        
        // Iterate through all the elements of the enum and add each card
        for card in getDeck()
        {
            majorArcana.updateValue(card, forKey: card.name)
        }
        return majorArcana
    }
    // This is a convienience method that builds a description of a card based on its properties
    func getCardDescription() ->String
    {
        // Removing the full at the end of the Interpretion for formatting reasons
        let stringLength = self.interpretation.characters.count
        let substringIndex = stringLength - 1
        let interpretationMinusFullStop = self.interpretation.substringWithRange(0, location: substringIndex)
        
        // Build the string description of the card
        var description = "This card is entitled \'" + self.name
        description +=  "\'. It is represented by the number \'" + String(self.rank)
        description += "\' and the Hebrew Letter \'" + "\(self.hebrewLetter)"
        description += "\'. It's general meaning is \'" + interpretationMinusFullStop
            + "\'."
        return description
    }
}

extension String
{
    func substringWithRange(_ start: Int, end: Int) -> String
    {
        if (start < 0 || start > self.characters.count)
        {
            print("start index \(start) out of bounds")
            return ""
        }
        else if end < 0 || end > self.characters.count
        {
            print("end index \(end) out of bounds")
            return ""
        }
        let range = (self.characters.index(self.startIndex, offsetBy: start) ..< self.characters.index(self.startIndex, offsetBy: end))
        return self.substring(with: range)
    }
    
    func substringWithRange(_ start: Int, location: Int) -> String
    {
        if (start < 0 || start > self.characters.count)
        {
            print("start index \(start) out of bounds")
            return ""
        }
        else if location < 0 || start + location > self.characters.count
        {
            print("end index \(start + location) out of bounds")
            return ""
        }
        let range = (self.characters.index(self.startIndex, offsetBy: start) ..< self.characters.index(self.startIndex, offsetBy: start + location))
        return self.substring(with: range)
    }
}
