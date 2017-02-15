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

// MARK: Class

/// A class representing the facebook social feed object
class FacebookSocialFeedObject: SocialFeedObject, Comparable {
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func ==(lhs: FacebookSocialFeedObject, rhs: FacebookSocialFeedObject) -> Bool {
        
        return (lhs.name == rhs.name && lhs.id == rhs.id && lhs.data == rhs.data && lhs.lastUpdated == rhs.lastUpdated)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func <(lhs: FacebookSocialFeedObject, rhs: FacebookSocialFeedObject) -> Bool {
        
        if lhs.lastUpdated != nil && rhs.lastUpdated != nil {
            
            return lhs.lastUpdated! < rhs.lastUpdated!
        } else if lhs.lastUpdated != nil && rhs.lastUpdated == nil {
            
            return false
        } else {
            
            return true
        }
    }
    
    // MARK: - Protocol's variables
    
    internal var protocolLastUpdate: Date?
    
    // MARK: - Class' variables

    /// The name of the record in database
    var name: String = ""
    
    /// The actual data of the record
    var data: FacebookDataSocialFeedObject = FacebookDataSocialFeedObject()
    
    /// The id of the record
    var id: Int = -1
    
    /// The last updated field of the record
    var lastUpdated: Date? = nil
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    init() {
        
        name = ""
        data = FacebookDataSocialFeedObject()
        id = -1
        lastUpdated = nil
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     */
    convenience init(from dict: Dictionary<String, JSON>) {
        
        self.init()
        
        if let tempName = dict["name"]?.stringValue {
            
            name = tempName
        }
        if let tempData = dict["data"]?.dictionaryValue {
            
            data = FacebookDataSocialFeedObject(from: tempData)
        }
        if let tempID = dict["id"]?.intValue {
            
            id = tempID
        }
        if let tempLastUpdated = dict["lastUpdated"]?.stringValue {
            
            lastUpdated = FormatterHelper.formatStringToDate(string: tempLastUpdated)
            protocolLastUpdate = lastUpdated
        }
    }
}
