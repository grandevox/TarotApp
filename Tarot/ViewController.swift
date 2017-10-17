//
//  ViewController.swift
//  Tarot
//
//  Created by Priscilla Jofani Oetomo on 10/17/17.
//  Copyright © 2017 grandevox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Property referencing the label in the view
    @IBOutlet weak var lblAnswers: UILabel!
    
    // Property referencing the image view in the storyboard
    @IBOutlet weak var imgCard: UIImageView!
    
    // Property referencing the model for managing data and business logic
    var model = Model()
    
    // Respond to the user clicking a button by providing advice from the oracle
    @IBAction func askTheOracle(sender: UIButton)
    {
        // Retrieves a random message from the oracle
        lblAnswers?.text = model.respond()
        
        // Change the image in the UIImageView to the currently selected card
        imgCard.image = UIImage(named:model.currentCard.imageName)
        
//        var cardImageName:String = ""
//        var message:String = ""
//        
//        model.respond(cardImageName: &cardImageName, message: &message)
//        
//        lblAnswers.text = message
//        imgCard.image = UIImage (named:cardImageName)
        
//        // This variable will receive a tuple from the respond method
//        let response :(cardImageName: String, cardMessage:String) = model.respond()
//        
//        lblAnswers.text = response.cardMessage
//        
//        imgCard.image = UIImage (named:response.cardImageName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    
    
//    JSpinner number = new JSpinner(model)
//    number.addChangeListener (new ChangeListener() {
//        int lastValue;
//        
//        @Override
//        public void stateChanged(ChangeEvent e) {
//            if (lastValue != null && !number.getValue().equals(lastValue)) {
//                System.out.println(number.getValue());
//            }
//            lastValue = number.getValue
//        }
//    });
    
    
    
    
    
    
//    class MyPanel extends JPanel {
//        @Override
//        public void paintComponent(Graphics g) {
//            super.paintComponent(g);
//    
//            ScalingPC scalingPC = new ScalingPC();
//            value = scalingPC.number.getValue;
//    
//            Graphics2D g2 = (Graphics2D)g;
//            ...
//    
//        }
//    
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

