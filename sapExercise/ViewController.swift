//
//  ViewController.swift
//  sapExercise
//
//  Created by Huy Truong on 3/21/17.
//  Copyright © 2017 Huy Truong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    //Added a viewForLayer view
    @IBOutlet weak var viewForLayer: UIView!
    
    @IBOutlet weak var textView: UITextView!
    
    
    //Creates a computerd property for the layer
    var l: CALayer {
        return viewForLayer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayer()
        setUpTextView()
        
        //Adding observer to know when user had changed
        //font size while app is running
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.preferredContentSizeDidChange(forChildContentContainer:)), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)

    }
    
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        
        print("I AM CALLED ALIVE")
        textView.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    }

    
    //Function to set up layer
    func setUpLayer() {
        
        //Setting background and border color
        l.backgroundColor = UIColor(red: 154.0/255.0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 1.0).cgColor
        l.borderColor = UIColor.white.cgColor
        
        //Setting border and corder
        l.borderWidth = 10.0
        l.cornerRadius = 100.0
        
        //Setting shadow
        l.shadowOffset = CGSize(width: 0,height: 5)
        l.shadowOpacity = 0.7
        l.shadowRadius = 7
      
        //Adding star image
        l.contents = UIImage(named: "star.png")?.cgImage
        l.contentsGravity = kCAGravityCenter
        
        
        /*The shadow is drawn outside of the layer's bounds. You have to set listView.layer.masksToBounds = NO to see the shadow
 
         if you set l.masksToBounds = YES you can't draw anything out side of bounds so you can not get shadow

         */
        l.masksToBounds = false
    }
    
    //Function to set up label for text
    func setUpTextView() {
        
        //Setting up path to find text file
        let path = Bundle.main.path(forResource: "text", ofType: "txt")
        
        //Saving the text file into a variable
        let text = try? NSString(contentsOfFile: path! as String, encoding: String.Encoding.utf8.rawValue)
        
//        print(text!)
        
        //Adding text to textView
        textView.text = text! as String
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

