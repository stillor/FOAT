//
//  ViewController.swift
//  FOAT
//
//  Created by stiller on 15/11/30.
//  Copyright © 2015年 stiller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btn:UIButton?
  
    @IBAction func Press(){
        self.performSegueWithIdentifier("LoginIdentifier", sender: self)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        //btn?.backgroundColor = UIColor(red: 30/255, green: 144/255, blue: 1, alpha: 1)
        NSUserDefaults.standardUserDefaults().setInteger(0, forKey: "login")
         btn?.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        let name = NSUserDefaults.standardUserDefaults().objectForKey("username")
        if name == nil{
            btn?.hidden = false
        }else{
         self.performSegueWithIdentifier("BarIdentifier", sender: self)
        }
    }
    
    
   

    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

