//
//  Student.swift
//  FOAT
//
//  Created by stiller on 15/12/1.
//  Copyright © 2015年 stiller. All rights reserved.
//

import Foundation

class student : NSObject{
    var Name:String=""
    var ID:String=""
    var Classnum:String=""
    var Phone:String=""
    var Email:String=""
    
    
    init(name:String,id:String,classnum:String,phone:String,email:String){
        self.Name=name
        self.ID=id
        self.Classnum=classnum
        self.Email=email
        self.Phone=phone
        
    }
    
    
}

