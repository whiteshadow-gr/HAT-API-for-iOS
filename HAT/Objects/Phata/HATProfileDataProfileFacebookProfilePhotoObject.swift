/**
 * Copyright (C) 2018 HAT Data Exchange Ltd
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

/// A struct representing the profile data Facebook Profile Photo object from the received profile JSON file
public struct HATProfileDataProfileFacebookProfilePhotoObject: Equatable {
    
    // MARK: - Fields
    
    /// The possible Fields of the JSON struct
    struct Fields {
        
        static let isPrivate: String = "private"
        static let isPrivateID: String = "privateID"
        static let name: String = "name"
        static let fieldID: String = "id"
        static let values: String = "values"
        static let value: String = "value"
    }
    
    // MARK: - Equatable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATProfileDataProfileFacebookProfilePhotoObject, rhs: HATProfileDataProfileFacebookProfilePhotoObject) -> Bool {
        
        return (lhs.isPrivate == rhs.isPrivate)
    }
    
    // MARK: - Variables
    
    /// Indicates if the object, HATProfileDataProfileFacebookProfilePhotoObject, is private
    public var isPrivate: Bool = true {
        
        didSet {
            
            isPrivateTuple = (isPrivate, isPrivateTuple.1)
        }
    }
    
    /// A tuple containing the isPrivate and the ID of the value
    var isPrivateTuple: (Bool, Int) = (true, 0)
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        isPrivate = true
        
        isPrivateTuple = (true, 0)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     */
    public init(from array: [JSON]) {
        
        for json in array {
            
            let dict = json.dictionaryValue
            
            if let tempName = (dict[Fields.name]?.stringValue), let id = dict[Fields.fieldID]?.intValue {
                
                if tempName == "private" {
                    
                    if let tempValues = dict[Fields.values]?.arrayValue {
                        
                        if let stringValue = tempValues[0].dictionaryValue[Fields.value]?.stringValue {
                            
                            if let result = Bool(stringValue) {
                                
                                isPrivate = result
                                isPrivateTuple = (isPrivate, id)
                            }
                        }
                    }
                }
            }
        }
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     */
    public init(alternativeArray: [JSON]) {
        
        for json in alternativeArray {
            
            let dict = json.dictionaryValue
            
            if let tempName = (dict[Fields.name]?.stringValue), let id = dict[Fields.fieldID]?.intValue {
                
                if tempName == "private" {
                    
                    isPrivate = true
                    isPrivateTuple = (isPrivate, id)
                }
            }
        }
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     */
    public init (fromCache: Dictionary<String, JSON>) {
        
        if let tempPrivate = (fromCache[Fields.isPrivate]?.stringValue) {
            
            if let isPrivateResult = Bool(tempPrivate) {
                
                isPrivate = isPrivateResult
            }
        }
        
        if let tempPrivateID = (fromCache[Fields.isPrivateID]?.intValue) {
            
            isPrivateTuple = (isPrivate, tempPrivateID)
        }
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            Fields.isPrivate: String(describing: self.isPrivate),
            Fields.isPrivateID: isPrivateTuple.1
        ]
    }
    
}
