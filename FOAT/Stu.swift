//
//  Stu.swift
//  FOAT
//
//  Created by stiller on 15/12/5.
//  Copyright © 2015年 stiller. All rights reserved.
//

import Foundation


class stu : NSObject{
    var Name:String = ""
    var ID:String = ""
    
    var Phone:String = ""
    var Email:String = ""
    var State:String = ""
    
    
    init(name:String,id:String,phone:String,email:String,state:String){
        self.Name=name
        self.ID=id
        self.Email=email
        self.Phone=phone
        self.State=state
        
    }
    
    
}
