//
//  ViewController.swift
//  Tarot
//
//  Created by Priscilla Jofani Oetomo on 10/17/17.
//  Copyright © 2017 grandevox. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    
    @IBOutlet weak var imgCard: UIImageView!
    // Property referencing the model for managing data and business logic
    var model = Model.sharedInstance
    
    @IBOutlet weak var placeHolder: UIView!
    
    @IBOutlet weak var cardDescription: UILabel!
    
    @IBOutlet weak var faded: UILabel!
    
    @IBOutlet weak var btnOracle: UIButton!
    
    @IBOutlet weak var cardTitle: UILabel!
    
    var showingBack = false
    var front:UIImageView!
    var back:UIImageView!
    var cardView: UIView!
    var direction: UIViewAnimationOptions = UIViewAnimationOptions.transitionFlipFromLeft
    var gesturesRegistered: Bool = false
    
    // Property to support formatting a string
    var attributedString:NSMutableAttributedString!
    // Respond to the user clicking a button by providing advice from the oracle
    @IBAction func askTheOracle(sender: UIButton)
    {
        lblAnswers.text = model.respond()
        
        imgCard.image = UIImage(named: model.currentCard.imageName)
        
        cardTitle.text = "The " + model.currentCard.name
        
        registerGestures()
        
        //        var cardImageName:String = ""
        //        var message:String = ""
        //
        //        model.respond(cardImageName: &cardImageName, message: &message)
        //
        //        lblAnswers.text = message
        //        imgCard.image = UIImage(named: cardImageName)
        //
        //        let response: (cardImageName:String, cardMessage:String) = model.respond()
        //
        //        lblAnswers.text = response.cardMessage
        //        imgCard.image = UIImage(named: response.cardImageName)
        
    }
    
    // Lifecycle method for performing tasks after the view has loaded
    override func viewDidLoad()
    {
        faded.isHidden = true
        cardDescription.isHidden = true
        lblAnswers.text =  "Think of a question, then click the button"
        imgCard.image = UIImage(named: "MajorArcana.jpg")
        cardTitle.text = ""
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact) {
            cardDescription.font = cardDescription.font.withSize(10)
            lblAnswers.font = lblAnswers.font.withSize(8)
        } else {
            cardDescription.font = cardDescription.font.withSize(17)
            lblAnswers.font = lblAnswers.font.withSize(17)
        }
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if (traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact) {
            cardDescription.font = cardDescription.font.withSize(10)
            lblAnswers.font = lblAnswers.font.withSize(8)
        } else {
            cardDescription.font = cardDescription.font.withSize(17)
            lblAnswers.font = lblAnswers.font.withSize(17)
        }
    }
    
    // Register gestures for swiping the card left and right
    fileprivate func registerGestures()
    {
        // Only register the gestures after the user has clicked on the 'Ask Oracle' button
        // Only register the gestures once
        if(!gesturesRegistered)
        {
            gesturesRegistered = true
            
            /* Set up flipping behaviour.  For the flipping behaviour to work
             * a subview must be added to the item to be flipped.  Here I used
             * an additional image view so I can show the currently selected card
             * on the back but it will be faded.  I hide both of these, so it doesn't
             * matter what you set it to.*/
            front = UIImageView(image: UIImage(named: "Fool.jpg"))
            back = UIImageView(image: UIImage(named: "Fool.jpg"))
            placeHolder.addSubview(back)
            back.isHidden = true
            front.isHidden = true
            
            // Add Swipe Gesture to the placeholder for the card
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
            swipeLeft.direction = UISwipeGestureRecognizerDirection.left
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipes(_:)))
            swipeRight.direction = UISwipeGestureRecognizerDirection.right
            
            placeHolder.addGestureRecognizer(swipeLeft)
            placeHolder.addGestureRecognizer(swipeRight)
        }
    }
    
    // Determine direction of swipe
    func handleSwipes(_ sender:UISwipeGestureRecognizer)
    {
        if (sender.direction == .left)
        {
            direction = UIViewAnimationOptions.transitionFlipFromRight
        }
        if (sender.direction == .right)
        {
            direction = UIViewAnimationOptions.transitionFlipFromLeft
        }
        showCard(direction)
    }
    
    // Setup card for display
    fileprivate func showCard(_ direction: UIViewAnimationOptions)
    {
        if (!showingBack)
        {
            UIView.transition(from: front, to: back, duration: 1, options: direction, completion: nil)
            showingBack = true
            
            // Change the image in the UIImageView to the currently selected card
            imgCard.image = UIImage(named:model.currentCard.imageName)
            cardDescription.text = model.currentCard.getCardDescription()
            
            lblAnswers.isHidden = true
            faded.isHidden = false
            cardDescription.isHidden = false
            btnOracle.isHidden = true
            
            formatText()
        }
        else
        {
            UIView.transition(from: back, to: front, duration: 1, options: direction, completion: nil)
            showingBack = false
            
            lblAnswers.isHidden = false
            faded.isHidden = true
            cardDescription.isHidden = true
            btnOracle.isHidden = false
        }
        
        if (traitCollection.horizontalSizeClass == .regular && traitCollection.verticalSizeClass == .compact) {
            cardDescription.font = cardDescription.font.withSize(10)
            lblAnswers.font = lblAnswers.font.withSize(8)
        } else {
            cardDescription.font = cardDescription.font.withSize(17)
            lblAnswers.font = lblAnswers.font.withSize(17)
        }
    }
    
    func applyHighlightsToText()
    {
        // 1. Create a range that equals the length of the string that contains the text to be highlighted
        let range = NSMakeRange(0, self.attributedString.length)
        
        // 2. Match items surrounded by single quotation marks
        let regexStr = "(\\'\\w+(.\\s\\w+)*\\')"
        let regex = try! NSRegularExpression(pattern: regexStr, options: [])
        
        // 3. Create attributes to apply to the text
        let colourAttributes = [NSForegroundColorAttributeName : UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1)]
        
        // 4. iterate over each match, making the text red
        regex.enumerateMatches(in: attributedString.string, options: [], range: range)
        {
            match, flags, stop in
            let matchRange = match!.rangeAt(1)
            self.attributedString.addAttributes(colourAttributes, range: matchRange)
        }
    }
    
    func applyFormattingToText()
    {
        let font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        let textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        
        let attributes = [
            NSForegroundColorAttributeName : textColor,
            NSFontAttributeName : font,
            ]
        attributedString = NSMutableAttributedString(string: model.currentCard.getCardDescription(), attributes: attributes)
    }
    
    fileprivate func formatText()
    {
        applyFormattingToText()
        applyHighlightsToText()
        
        cardDescription.attributedText = attributedString
    }
    
    
    // Lifecycle method for clearing up memory resources
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

