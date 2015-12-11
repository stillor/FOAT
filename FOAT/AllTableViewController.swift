//
//  AllTableViewController.swift
//  FOAT
//
//  Created by stiller on 15/12/1.
//  Copyright © 2015年 stiller. All rights reserved.
//

import UIKit

class AllTableViewController: UITableViewController {
    
    
    var absentstu = [student(name: "", id: "",classnum: "",phone: "", email: "")]
    var leavestu = [student(name: "", id: "",classnum: "", phone: "", email: "")]
    var latestu = [student(name: "", id: "",classnum: "", phone: "", email: "")]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        synchronousPost()
        
        self.refreshControl = UIRefreshControl()
        
        self.refreshControl?.addTarget(self, action: "refreshData", forControlEvents: UIControlEvents.ValueChanged)
        self.navigationController?.navigationBar.barTintColor=UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
        self.tabBarController?.tabBar.selectedImageTintColor=UIColor(red: 255/255, green: 51/255, blue: 52/255, alpha: 1)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tabBarController?.tabBar.selectedImageTintColor=UIColor(red: 255/255, green: 51/255, blue: 52/255, alpha: 1)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
    
    func synchronousPost(){
        let name:String = NSUserDefaults.standardUserDefaults().valueForKey("username") as! String
        let pass:String = NSUserDefaults.standardUserDefaults().valueForKey("password") as! String
        let url:NSURL! = NSURL(string: "http://192.168.252.6:8080/Foat/process?action=teacherAuthenticateJSON&teacherName=\(name)&password=\(pass)")
        let request:NSMutableURLRequest = NSMutableURLRequest(URL: url, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringCacheData, timeoutInterval: 10)
            request.HTTPMethod = "POST"
        var response:NSURLResponse?
     do{
        let data:NSData = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
                let json:AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments)
                //解析JSON字符串
                let error = json.objectForKey("Error")
                if error == nil{
                    
                    
                    let objs = json.objectForKey("AbsentStudents")
                    for var i = 0; i < objs?.count; i+=1 {
                        let n = objs?.objectAtIndex(i).objectForKey("Name") as! String
                        let d = objs?.objectAtIndex(i).objectForKey("ID") as! String
                        let c = objs?.objectAtIndex(i).objectForKey("Class") as! String
                        let e = objs?.objectAtIndex(i).objectForKey("Email") as! String
                        let p = objs?.objectAtIndex(i).objectForKey("Phone") as! String
                        let stu = student(name: n, id: d, classnum: c,phone: p, email: e)
                        if i == 0{
                            self.absentstu[0] = stu
                        }else{
                            self.absentstu.append(stu)
                        }
                        
                    }
                    
                    let objs1 = json.objectForKey("LeaveStudents")
                    for var i = 0; i < objs1?.count; i+=1 {
                        let n = objs1?.objectAtIndex(i).objectForKey("Name") as! String
                        let d = objs1?.objectAtIndex(i).objectForKey("ID") as! String
                        let c = objs1?.objectAtIndex(i).objectForKey("Class") as! String
                        let e = objs1?.objectAtIndex(i).objectForKey("Email") as! String
                        let p = objs1?.objectAtIndex(i).objectForKey("Phone") as! String
                        let stu = student(name: n, id: d,classnum: c, phone: p, email: e)
                        if i == 0{
                            self.leavestu[0] = stu
                        }else{
                            self.leavestu.append(stu)
                        }
                    }
                    
                    let objs2 = json.objectForKey("LateStudents")
                    for var i = 0; i < objs2?.count; i+=1 {
                        let n = objs2?.objectAtIndex(i).objectForKey("Name") as! String
                        let d = objs2?.objectAtIndex(i).objectForKey("ID") as! String
                        let c = objs2?.objectAtIndex(i).objectForKey("Class") as! String
                        let e = objs2?.objectAtIndex(i).objectForKey("Email") as! String
                        let p = objs2?.objectAtIndex(i).objectForKey("Phone") as! String
                        let stu = student(name: n, id: d,classnum: c, phone: p, email: e)
                        if i == 0{
                            self.latestu[0] = stu
                        }else{
                            self.latestu.append(stu)
                        }
                    }

                }else{
                    
                }
            }catch{
                
                print("Something is worry")
                
            }
        
        
    }
    
    
    func refreshData(){
         absentstu = [student(name: "", id: "",classnum: "",phone: "", email: "")]
         leavestu = [student(name: "", id: "",classnum: "", phone: "", email: "")]
         latestu = [student(name: "", id: "",classnum: "", phone: "", email: "")]
         synchronousPost()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number 
        if section == 0 {
            //return absentstu.count
            return absentstu.count
        }else if section == 1{
            return leavestu.count
        }else{
            return  latestu.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.tableFooterView=UIView()
        tableView.registerNib(UINib(nibName: "AllTableViewCell", bundle:nil),forCellReuseIdentifier: "cell")
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AllTableViewCell
        
        
        if indexPath.section == 0{
            if absentstu[0].Name == ""{
                cell.name?.text = "无学生"
                cell.name?.textColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
                cell.userInteractionEnabled = false
            }else{
             cell.name?.text = absentstu[indexPath.row].Name as String
                cell.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
            }
        }else if indexPath.section == 1{
            if leavestu[0].Name == ""{
                cell.name?.text = "无学生"
                cell.name?.textColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
                cell.userInteractionEnabled = false
            }else{
             cell.name?.text = leavestu[indexPath.row].Name as String
                cell.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
            }
        }else{
            if latestu[0].Name == ""{
                cell.name?.text = "无学生"
                cell.name?.textColor = UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
                cell.userInteractionEnabled = false
            }else{
                cell.name?.text = latestu[indexPath.row].Name as String
                cell.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator
            }
        }
        
        return cell

    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "未到"
        }else if section == 1{
            return "请假"
        }else{
            return "迟到"
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc =       storyboard?.instantiateViewControllerWithIdentifier("DetailIdentifier") as! DetailTableViewController
        if indexPath.section == 0{
            let s = absentstu[indexPath.row]
            vc.name = s.Name
            vc.id = s.ID
            vc.classnum = s.Classnum
            vc.phone = s.Phone
            vc.email = s.Email
            vc.state = "未到"
        }else if indexPath.section == 1{
            let s = leavestu[indexPath.row]
            vc.name = s.Name
            vc.id = s.ID
            vc.classnum = s.Classnum
            vc.phone = s.Phone
            vc.email = s.Email
            vc.state = "请假"
        }else{
            let s = latestu[indexPath.row]
            vc.name = s.Name
            vc.id = s.ID
            vc.classnum = s.Classnum
            vc.phone = s.Phone
            vc.email = s.Email
            vc.state = "迟到"
        }
    
        self.navigationController?.pushViewController(vc, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
