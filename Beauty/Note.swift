//
//  Note.swift
//  Beauty
//
//  Created by Nobel on 2016/11/15.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import RealmSwift

class Note: Object {
    dynamic var title = ""
    dynamic var content = ""
    dynamic var time = ""
    dynamic var image = ""
    dynamic var reminder = ""
    dynamic var weather = ""
    dynamic var location = ""
    dynamic var imageWidth: Float = 0.1
    dynamic var imageHeight: Float = 0.1
}
