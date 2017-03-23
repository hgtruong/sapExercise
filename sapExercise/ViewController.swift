//
//  ViewController.swift
//  sapExercise
//
//  Created by Huy Truong on 3/21/17.
//  Copyright © 2017 Huy Truong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var topRightView: UIView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet var rootView: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//        setUpLayer()
        setUpTextView()
        
        
        
        //Adding observer to know when user had changed
        //font size while app is running
        //** REMEMBER TO CHANGE FONT TO TEXT STYLE**
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.preferredContentSizeDidChange(forChildContentContainer:)), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)

    }

    
    override func preferredContentSizeDidChange(forChildContentContainer container: UIContentContainer) {
        textView.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setUpLayer()
    }
    
    
    //Function to set up layer
    func setUpLayer() {
     
        //create sublayer
        let subLayer = CALayer()
        
        //adding sublayer to main view
        topRightView.layer.addSublayer(subLayer)
        
        
        
        
//        subLayer.frame = CGRect(origin: CGPoint.zero, size: topRightView.bounds.size)
        
//        subLayer.frame = CGRect(x: 0, y: 0, width: topRightView.bounds.width, height: topRightView.bounds.height)
        
//        subLayer.position = CGPoint(x: topRightView.bounds.minX, y:topRightView.bounds.minX)
                
        subLayer.frame = topRightView.bounds
   
        
        
        print("sublayer frame width: \(subLayer.frame.width) and sublayer frame height: \(subLayer.frame.height)")
        
        print("sub layer bounds width: \(subLayer.bounds.width) and sublayer bounds height: \(subLayer.bounds.height)")
        
        print("top right frame width: \(topRightView.frame.width) and top right frame height: \(topRightView.frame.height)")
        
        print("top right bounds width: \(topRightView.bounds.width) and top right bounds height: \(topRightView.bounds.height)")
        
        
        print("txf: \(topRightView.frame.minX) and tyf: \(topRightView.frame.minY)")
        
        print("txb: \(topRightView.bounds.minX) and tyb: \(topRightView.bounds.minY)")
        
        print("sxf: \(subLayer.frame.minX) and syf: \(subLayer.frame.minY)")
        
        print("sxb: \(subLayer.bounds.minX) and syb: \(subLayer.bounds.minY)")

        
        //Adding star image
        subLayer.contents = UIImage(named: "star.png")?.cgImage
        subLayer.contentsGravity = kCAGravityCenter
        
        
        //Setting background and border color
        subLayer.backgroundColor = UIColor(red: 154.0/255.0, green: 154.0/255.0, blue: 154.0/255.0, alpha: 1.0).cgColor
        subLayer.borderColor = UIColor.white.cgColor
        
        
        
        //Setting border and corder
        subLayer.borderWidth = 10.0
        subLayer.cornerRadius = 100.0
        
        //Setting shadow
        subLayer.shadowOffset = CGSize(width: 0,height: 5)
        subLayer.shadowOpacity = 0.7
        subLayer.shadowRadius = 7
      
        
        /*The shadow is drawn outside of the layer's bounds. You have to set listView.layer.masksToBounds = NO to see the shadow
 
         if you set subLayer.masksToBounds = YES you can't draw anything out side of bounds so you can not get shadow

         */
        subLayer.masksToBounds = false
        
        
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

