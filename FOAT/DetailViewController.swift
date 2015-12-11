//
//  DetailViewController.swift
//  FOAT
//
//  Created by stiller on 15/12/1.
//  Copyright © 2015年 stiller. All rights reserved.
//

import UIKit
import MessageUI

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var namelabel:UILabel?
    @IBOutlet var idlabel:UILabel?
    @IBOutlet var classlabel:UILabel?
    @IBOutlet var phonelabel:UILabel?
    @IBOutlet var emaillabel:UILabel?
    
    @IBOutlet var telbtn:UIButton?
    @IBOutlet var smsbtn:UIButton?
    
    @IBAction func tel(){
        
        let callWebView = UIWebView()
        
        let url1 = NSURL(string: "tel://"+phone!)
        callWebView.loadRequest(NSURLRequest(URL: url1!))
        self.view.addSubview(callWebView)
        
    }
    
    @IBAction func sms(){
        let callWebView = UIWebView()
        let url1 = NSURL(string: "sms://"+phone!)
        callWebView.loadRequest(NSURLRequest(URL: url1!))
        self.view.addSubview(callWebView)
    }
    
    var name:String?
    var id:String?
    var classnum:String?
    var phone:String?
    var email:String?
    var state:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        namelabel?.text=name
        idlabel?.text=id
        classlabel?.text=classnum
        phonelabel?.text=phone
        emaillabel?.text=email
        
        
        
        telbtn?.backgroundColor = UIColor(colorLiteralRed: 68/255, green: 125/255, blue: 214/255, alpha: 1)
        smsbtn?.backgroundColor = UIColor(colorLiteralRed: 33/255, green: 176/255, blue: 123/255, alpha: 1)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        tableview!.registerNib(UINib(nibName: "DetailTableViewCell", bundle:nil),forCellReuseIdentifier: "cell")
//        
//        let cell = tableview!.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DetailTableViewCell
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = "xinming:"
        cell.textLabel?.text = name
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
