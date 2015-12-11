//
//  classobj.swift
//  FOAT
//
//  Created by stiller on 15/12/8.
//  Copyright © 2015年 stiller. All rights reserved.
//

import Foundation

class classobj : NSObject{
    var className:String = ""
    var classId:String = ""
    
    init(classname:String,classid:String){
        self.className = classname
        self.classId = classid
    }
}
