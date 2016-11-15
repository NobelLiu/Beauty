//
//  Note.swift
//  Beauty
//
//  Created by Nobel on 2016/11/15.
//  Copyright © 2016年 Nobel. All rights reserved.
//

import RealmSwift

class Note: Object {
    dynamic var title: String?
    dynamic var content: String?
    dynamic var time: String?
    dynamic var image: String?
    dynamic var reminder: String?
    dynamic var weather: String?
    dynamic var location: String?
}
