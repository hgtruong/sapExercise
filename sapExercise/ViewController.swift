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
    
    @IBOutlet weak var topRightView: UIView!
    
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
        //** REMEMBER TO CHANGE FONT TO TEXT STYLE**
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.preferredContentSizeDidChange(forChildContentContainer:)), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)

    }
    
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        textView.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    }

    
    //Function to set up layer
    func setUpLayer() {
     
        //create sublayer
        let starLayer = CALayer()
        
        starLayer.frame = CGRect(x: 0, y: 0, width: topRightView.frame.width, height: topRightView.frame.height)

        
        print("width: \(starLayer.frame.width) and height: \(starLayer.frame.height)")
        
        print("bwidth: \(starLayer.bounds.width) and bheight: \(starLayer.bounds.height)")
        
        print("txf: \(topRightView.frame.minX) and tyf: \(topRightView.frame.minY)")
        
        print("txb: \(topRightView.bounds.minX) and tyb: \(topRightView.bounds.minY)")
        
        print("sxf: \(starLayer.frame.minX) and syf: \(starLayer.frame.minY)")
        
        print("sxb: \(starLayer.bounds.minX) and syb: \(starLayer.bounds.minY)")


        
        
        //adding sublayer to main view
        topRightView.layer.addSublayer(starLayer)
        
        
        //Setting background and border color
        starLayer.backgroundColor = UIColor(red: 154.0/255.0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 1.0).cgColor
        starLayer.borderColor = UIColor.white.cgColor
        
        
        
        //Setting border and corder
        starLayer.borderWidth = 10.0
        starLayer.cornerRadius = 100.0
        
        //Setting shadow
        starLayer.shadowOffset = CGSize(width: 0,height: 5)
        starLayer.shadowOpacity = 0.7
        starLayer.shadowRadius = 7
      
        //Adding star image
        starLayer.contents = UIImage(named: "star.png")?.cgImage
        starLayer.contentsGravity = kCAGravityCenter
        
        /*The shadow is drawn outside of the layer's bounds. You have to set listView.layer.masksToBounds = NO to see the shadow
 
         if you set starLayer.masksToBounds = YES you can't draw anything out side of bounds so you can not get shadow

         */
        starLayer.masksToBounds = false
        
    }
    
    
    //Function to set up label for text
    func setUpTextView() {
        
        //Setting up path to find text file
        let path = Bundle.main.path(forResource: "text", ofType: "txt")
        
        //Saving the text file into a variable
        let text = try? NSString(contentsOfFile: path! as String, encoding: String.Encoding.utf8.rawValue)

        
        //Adding text to textView
        textView.text = text! as String
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

