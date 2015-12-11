//
//  LoginViewController.swift
//  FOAT
//
//  Created by stiller on 15/12/4.
//  Copyright © 2015年 stiller. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet var username:UITextField?
    @IBOutlet var password:UITextField?
    @IBOutlet var t:UILabel?
    @IBOutlet var v:UIView?
    @IBOutlet var loginbtn:UIButton?
    @IBOutlet var tip:UILabel?
    
    var name:String?
    var pass:String?
    
    @IBAction func login(){
        
        name = (username?.text)!
        pass = (password?.text)!
        if name != "" && pass != "" {
            
        asynchronousPost(name!,pass:pass!)
            
            
            
        }
        
    }
    
  func asynchronousPost(name:String,pass:String) -> Bool{
        let url:NSURL! = NSURL(string: "http://192.168.252.6:8080/Foat/process?action=teacherAuthenticateJSON&teacherName=\(name)&password=\(pass)")
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringCacheData, timeoutInterval: 10)
        var flag:Bool = false
        request.HTTPMethod = "POST"
        
        NSURLConnection.sendAsynchronousRequest(request, queue:NSOperationQueue.mainQueue()){
            (response, data, error) -> Void in
            if data != nil{
           do{
                
                let json:AnyObject = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.AllowFragments)
                //解析JSON字符串
                 
                    let error = json.objectForKey("Error")
                if error == nil{
                    let teacherName = json.objectForKey("TeacherName") as! String
                    let adminPhone = json.objectForKey("AdminPhone") as! String
                    NSUserDefaults.standardUserDefaults().setObject(name, forKey: "username")
                    NSUserDefaults.standardUserDefaults().setObject(pass, forKey: "password")
                    NSUserDefaults.standardUserDefaults().setObject(teacherName, forKey: "name")
                    NSUserDefaults.standardUserDefaults().setObject(adminPhone, forKey: "phone")
                    NSUserDefaults.standardUserDefaults().setInteger(1, forKey: "login")
                self.performSegueWithIdentifier("BartIdentifier", sender: self)
                    flag = true
                }else{
                   self.tip?.text = "用户名或密码错误"
                   self.tip?.textColor = UIColor.redColor()
                }
            }catch let erro{
                
                print("Something is worry with \(erro)")
                
            }
            
            
        }
    }
    
        return flag
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let destination = segue.destinationViewController as!
//            AllTableViewController
//        destination.absentstu = absentstu
//        destination.leavestu = leavestu
//        
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        username?.placeholder="请输入用户名"
        password?.placeholder="请输入密码"
        password?.secureTextEntry = true
        v?.backgroundColor = UIColor(colorLiteralRed: 94/255, green: 94/255, blue: 94/255, alpha: 1)
        loginbtn?.backgroundColor = UIColor(colorLiteralRed: 68/255, green: 125/255, blue: 214/255, alpha: 1)
        self.navigationController?.navigationBar.barTintColor=UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        setTabBarVisible(!tabBarIsVisible(), animated: true)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        //setNavBarVisible(!navBarIsVisible(), animated: true)
    }
    
    func setTabBarVisible(visible:Bool, animated:Bool) {
        if (tabBarIsVisible() == visible) { return }
        let frame = self.tabBarController?.tabBar.frame
        let offsetY = (visible ? CGFloat(0) : 49.0)
        let duration:NSTimeInterval = (animated ? 0.3 : 0.0)
        if frame != nil {
            UIView.animateWithDuration(duration) {
                self.tabBarController?.tabBar.frame = CGRectOffset(frame!, 0, offsetY)
                return
            }
        }
    }
    
    func tabBarIsVisible() ->Bool {
        return self.tabBarController?.tabBar.frame.origin.y < CGRectGetMaxY(self.view.frame)
    }
    func navBarIsVisible() ->Bool {
        return self.navigationController?.navigationBar.frame.origin.y > CGRectGetMinY(UIScreen.mainScreen().bounds)
    }
    func setNavBarVisible(visible:Bool, animated:Bool) {
        if (navBarIsVisible() == visible) { return }
        let frame = self.navigationController?.navigationBar.frame
        let offsetY = (visible ? CGFloat(0) : -64.0)
        let duration:NSTimeInterval = (animated ? 0.3 : 0.0)
        if frame != nil {
            UIView.animateWithDuration(duration) {
                self.navigationController?.navigationBar.frame = CGRectOffset(frame!, 0, offsetY)
                return
            }
        }
        
    }
           

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.username?.resignFirstResponder()
        self.password?.resignFirstResponder()
        
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
