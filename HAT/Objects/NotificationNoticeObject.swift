/**
 * Copyright (C) 2017 HAT Data Exchange Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

import SwiftyJSON

// MARK: Struct

public struct NotificationNoticeObject {
    
    // MARK: - Variables
    
    var noticeID: Int = -1
    var message: String = ""
    var dateCreated: Date = Date()
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    init() {
        
        noticeID = -1
        message = ""
        dateCreated = Date()
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     */
    init(dictionary: Dictionary<String, JSON>) {
        
        if let tempNoticeID = dictionary["id"]?.int {
            
            noticeID = tempNoticeID
        }
        
        if let tempMessage = dictionary["message"]?.string {
            
            message = tempMessage
        }
        
        if let tempDateCreated = dictionary["dateCreated"]?.intValue {
            
            dateCreated = Date(timeIntervalSince1970: TimeInterval(tempDateCreated))
        }
    }
}
