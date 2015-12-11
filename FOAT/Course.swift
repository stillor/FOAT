//
//  Course.swift
//  FOAT
//
//  Created by stiller on 15/12/5.
//  Copyright © 2015年 stiller. All rights reserved.
//

import Foundation


class course{
    
    var Name:String = ""
    var ID:String = ""
    var TeacherName:String = ""
    var StudentNumber:String = ""
    var Attend:String = ""
    var Leave:String = ""
    var Absent:String = ""
    var Time:String = ""
    
    init(name:String,id:String,teacherName:String,studentNumber:String,attend:String,leave:String,absent:String,time:String){
        
        self.Name = name
        self.ID = id
        self.TeacherName = teacherName
        self.StudentNumber = studentNumber
        self.Attend = attend
        self.Leave = leave
        self.Absent = absent
        self.Time = time
    }
    
}