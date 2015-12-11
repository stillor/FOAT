//
//  DetailTableViewController.swift
//  FOAT
//
//  Created by stiller on 15/12/8.
//  Copyright © 2015年 stiller. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var name:String?
    var id:String?
    var classnum:String?
    var phone:String?
    var email:String?
    var state:String?
    
    var items:[String] = ["姓名：","学号：","班级：","到勤：","电话：","邮箱："]
    var item:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        item = [name!,id!,classnum!,state!,phone!,email!]
        
        self.navigationController?.navigationBar.barTintColor=UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1)
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
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return items.count
        }else{
          return 1
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.tableFooterView=UIView()
        if indexPath.section == 0{
        tableView.registerNib(UINib(nibName: "DetailTableViewCell", bundle:nil),forCellReuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DetailTableViewCell
            cell.title?.text = items[indexPath.row]
            cell.info?.text = item![indexPath.row]
            if indexPath.row == 3{
            if item![3] == "未到"{
                cell.info?.textColor = UIColor.redColor()
            }else if item![3] == "请假"{
                cell.info?.textColor = UIColor.orangeColor()
            }else if item![3] == "迟到"{
                 cell.info?.textColor = UIColor.redColor()
            }else{
                cell.info?.textColor = UIColor(colorLiteralRed: 68/255, green: 125/255, blue: 214/255, alpha: 1)
            }
            }
            cell.userInteractionEnabled = false
            return cell
        }else if indexPath.section == 1 && indexPath.row == 0{
            tableView.registerNib(UINib(nibName: "BtnTableViewCell", bundle:nil),forCellReuseIdentifier: "cell")
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! BtnTableViewCell
            cell.btn?.text = "打电话"
            cell.btn?.textColor = UIColor.whiteColor()
            //cell.img?.image = UIImage(imageLiteral: "tel")
            cell.backgroundColor = UIColor(colorLiteralRed: 68/255, green: 125/255, blue: 214/255, alpha: 1)
            return cell
        }else{
            tableView.registerNib(UINib(nibName: "BtnTableViewCell", bundle:nil),forCellReuseIdentifier: "cell")
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! BtnTableViewCell
            cell.btn?.text = "发短信"
            cell.btn?.textColor = UIColor.whiteColor()
            //cell.img?.image = UIImage(imageLiteral: "sms")
            cell.backgroundColor = UIColor(colorLiteralRed: 33/255, green: 176/255, blue: 123/255, alpha: 1)
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 1 && indexPath.row == 0{
            let callWebView = UIWebView()
            
            let url1 = NSURL(string: "tel://"+phone!)
            callWebView.loadRequest(NSURLRequest(URL: url1!))
            self.view.addSubview(callWebView)

            
        }
        if indexPath.section == 2 && indexPath.row == 0{
            let callWebView = UIWebView()
            
            let url1 = NSURL(string: "sms://"+phone!)
            callWebView.loadRequest(NSURLRequest(URL: url1!))
            self.view.addSubview(callWebView)
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
         return " "
        
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
