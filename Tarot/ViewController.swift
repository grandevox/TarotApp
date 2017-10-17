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
    
    // Property referencing the model for managing data and business logic
    var model = Model()
    
    // Respond to the user clicking a button by providing advice from the oracle
    @IBAction func askTheOracle(sender: UIButton)
    {
        lblAnswers.text = model.respond()
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

