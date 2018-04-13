//
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

import Alamofire
import Mockingjay
import SwiftyJSON
import XCTest

internal class HATDataOffersTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetDataOffers() {
        
        let body: [[String: Any]] = [
            [
                "id": "97a0748f-bf81-4aaa-8f39-97ac2557d920",
                "created": "2017-12-11T13:49:59.022Z",
                "merchantCode": "databuyerpublic",
                "title": "Location testing offer (round 2)",
                "shortDescription": "Gimme locations",
                "longDescription": "Test test test",
                "illustrationUrl": "https://avatars3.githubusercontent.com/u/9696080?s=400&v=4",
                "starts": "2017-12-11T00:00:00.000Z",
                "expires": "2018-06-01T00:00:00.000Z",
                "collectFor": 1,
                "requiredDataDefinition": [
                    "name": "97a0748f-bf81-4aaa-8f39-97ac2557d920",
                    "bundle": [
                        "iphone/locations": [
                            "endpoints": [
                                [
                                    "endpoint": "iphone/locations",
                                    "mapping": [
                                        "accuracy": "accuracy",
                                        "latitude": "latitude",
                                        "longitude": "longitude",
                                        "timestamp": "timestamp",
                                        "lastUpdated": "lastUpdated",
                                        "locations.accuracy": "locations.accuracy",
                                        "locations.latitude": "locations.latitude",
                                        "locations.longitude": "locations.longitude",
                                        "locations.timestamp": "locations.timestamp"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ],
                        "rumpel/locations/ios": [
                            "endpoints": [
                                [
                                    "endpoint": "rumpel/locations/ios",
                                    "mapping": [
                                        "speed": "speed",
                                        "course": "course",
                                        "altitude": "altitude",
                                        "latitude": "latitude",
                                        "longitude": "longitude",
                                        "dateSynced": "dateSynced",
                                        "dateCreated": "dateCreated",
                                        "dateCreatedLocal": "dateCreatedLocal",
                                        "verticalAccuracy": "verticalAccuracy",
                                        "horizontalAccuracy": "horizontalAccuracy"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ]
                    ]
                ],
                "requiredMinUser": 2,
                "requiredMaxUser": 100,
                "totalUserClaims": 7,
                "pii": false,
                "reward": [
                    "currency": "gbp",
                    "value": 1,
                    "rewardType": "cash"
                ],
                "owner": [
                    "id": "055a88b2-d45f-4e46-a561-b7d805f9d19b",
                    "email": "augustinas.markevicius@hatdex.org",
                    "nick": "Gus",
                    "firstName": "Augustinas",
                    "lastName": "Markevicius"
                ],
                "claim": [
                    "dateCreated": "2018-01-02T15:23:02.073Z",
                    "status": "claimed",
                    "confirmed": false,
                    "dataDebitId": "97a0748f-bf81-4aaa-8f39-97ac2557d920"
                ]
            ],
            [
                "id": "a297bb0c-dcc5-44b6-9a22-a0b94500209b",
                "created": "2017-10-13T10:27:16.935Z",
                "merchantCode": "databuyerpublic",
                "title": "Gimme yarr location",
                "shortDescription": "Test offer",
                "longDescription": "Accept only if testing.",
                "illustrationUrl": "https://www.synopsys.com/content/dam/synopsys/sig-assets/icons/SAST_orig.jpg.imgw.850.x.jpg",
                "starts": "2017-10-13T00:00:00.000Z",
                "expires": "2017-11-12T00:00:00.000Z",
                "collectFor": 1,
                "requiredDataDefinition": [
                    "name": "a297bb0c-dcc5-44b6-9a22-a0b94500209b",
                    "bundle": [
                        "iphone/locations": [
                            "endpoints": [
                                [
                                    "endpoint": "iphone/locations",
                                    "mapping": [
                                        "accuracy": "accuracy",
                                        "latitude": "latitude",
                                        "longitude": "longitude",
                                        "timestamp": "timestamp",
                                        "lastUpdated": "lastUpdated",
                                        "locations.accuracy": "locations.accuracy",
                                        "locations.latitude": "locations.latitude",
                                        "locations.longitude": "locations.longitude",
                                        "locations.timestamp": "locations.timestamp"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ]
                    ]
                ],
                "requiredMinUser": 1,
                "requiredMaxUser": 444,
                "totalUserClaims": 6,
                "pii": false,
                "reward": [
                    "currency": "gbp",
                    "value": 3,
                    "rewardType": "cash"
                ],
                "owner": [
                    "id": "055a88b2-d45f-4e46-a561-b7d805f9d19b",
                    "email": "augustinas.markevicius@hatdex.org",
                    "nick": "Gus",
                    "firstName": "Augustinas",
                    "lastName": "Markevicius"
                ],
                "claim": [
                    "dateCreated": "2017-10-13T10:31:09.785Z",
                    "status": "claimed",
                    "confirmed": false,
                    "dataDebitId": "a297bb0c-dcc5-44b6-9a22-a0b94500209b"
                ]
            ],
            [
                "id": "316ec4c9-ca17-42e6-8408-c78a7650aab8",
                "created": "2017-10-12T09:12:12.288Z",
                "merchantCode": "databuyerpublic",
                "title": "Multiple endpoint test",
                "shortDescription": "Accept this offer only if testing",
                "longDescription": "Testing offer",
                "illustrationUrl": "https://www.synopsys.com/content/dam/synopsys/sig-assets/icons/SAST_orig.jpg.imgw.850.x.jpg",
                "starts": "2017-10-12T00:00:00.000Z",
                "expires": "2017-11-11T00:00:00.000Z",
                "collectFor": 1,
                "requiredDataDefinition": [
                    "name": "316ec4c9-ca17-42e6-8408-c78a7650aab8",
                    "bundle": [
                        "twitter/tweets": [
                            "endpoints": [
                                [
                                    "endpoint": "twitter/tweets",
                                    "mapping": [
                                        "id": "id",
                                        "lang": "lang",
                                        "text": "text",
                                        "source": "source",
                                        "user.id": "user.id",
                                        "favorited": "favorited",
                                        "retweeted": "retweeted",
                                        "truncated": "truncated",
                                        "tweets.id": "tweets.id",
                                        "user.lang": "user.lang",
                                        "user.name": "user.name",
                                        "created_at": "created_at",
                                        "lastUpdated": "lastUpdated",
                                        "tweets.lang": "tweets.lang",
                                        "tweets.text": "tweets.text",
                                        "retweet_count": "retweet_count",
                                        "tweets.source": "tweets.source",
                                        "favorite_count": "favorite_count",
                                        "tweets.user.id": "tweets.user.id",
                                        "tweets.place.id": "tweets.place.id",
                                        "quoted_status_id": "quoted_status_id",
                                        "tweets.favorited": "tweets.favorited",
                                        "tweets.place.url": "tweets.place.url",
                                        "tweets.retweeted": "tweets.retweeted",
                                        "tweets.truncated": "tweets.truncated",
                                        "tweets.user.lang": "tweets.user.lang",
                                        "tweets.user.name": "tweets.user.name",
                                        "user.screen_name": "user.screen_name",
                                        "tweets.created_at": "tweets.created_at",
                                        "tweets.place.name": "tweets.place.name",
                                        "user.listed_count": "user.listed_count",
                                        "possibly_sensitive": "possibly_sensitive",
                                        "user.friends_count": "user.friends_count",
                                        "in_reply_to_user_id": "in_reply_to_user_id",
                                        "user.statuses_count": "user.statuses_count",
                                        "tweets.place.country": "tweets.place.country",
                                        "tweets.retweet_count": "tweets.retweet_count",
                                        "user.followers_count": "user.followers_count",
                                        "in_reply_to_status_id": "in_reply_to_status_id",
                                        "tweets.favorite_count": "tweets.favorite_count",
                                        "user.favourites_count": "user.favourites_count",
                                        "tweets.place.full_name": "tweets.place.full_name",
                                        "in_reply_to_screen_name": "in_reply_to_screen_name",
                                        "tweets.place.place_type": "tweets.place.place_type",
                                        "tweets.quoted_status_id": "tweets.quoted_status_id",
                                        "tweets.user.screen_name": "tweets.user.screen_name",
                                        "tweets.user.listed_count": "tweets.user.listed_count",
                                        "tweets.place.country_code": "tweets.place.country_code",
                                        "tweets.possibly_sensitive": "tweets.possibly_sensitive",
                                        "tweets.user.friends_count": "tweets.user.friends_count",
                                        "tweets.in_reply_to_user_id": "tweets.in_reply_to_user_id",
                                        "tweets.user.statuses_count": "tweets.user.statuses_count",
                                        "tweets.user.followers_count": "tweets.user.followers_count",
                                        "tweets.in_reply_to_status_id": "tweets.in_reply_to_status_id",
                                        "tweets.user.favourites_count": "tweets.user.favourites_count",
                                        "tweets.in_reply_to_screen_name": "tweets.in_reply_to_screen_name"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ],
                        "iphone/locations": [
                            "endpoints": [
                                [
                                    "endpoint": "iphone/locations",
                                    "mapping": [
                                        "accuracy": "accuracy",
                                        "latitude": "latitude",
                                        "longitude": "longitude",
                                        "timestamp": "timestamp",
                                        "lastUpdated": "lastUpdated",
                                        "locations.accuracy": "locations.accuracy",
                                        "locations.latitude": "locations.latitude",
                                        "locations.longitude": "locations.longitude",
                                        "locations.timestamp": "locations.timestamp"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ]
                    ]
                ],
                "requiredMinUser": 1,
                "requiredMaxUser": 444,
                "totalUserClaims": 5,
                "pii": false,
                "reward": [
                    "currency": "gbp",
                    "value": 55,
                    "rewardType": "cash"
                ],
                "owner": [
                    "id": "055a88b2-d45f-4e46-a561-b7d805f9d19b",
                    "email": "augustinas.markevicius@hatdex.org",
                    "nick": "Gus",
                    "firstName": "Augustinas",
                    "lastName": "Markevicius"
                ],
                "claim": [
                    "dateCreated": "2017-10-13T12:34:18.398Z",
                    "status": "claimed",
                    "confirmed": false,
                    "dataDebitId": "316ec4c9-ca17-42e6-8408-c78a7650aab8"
                ]
            ]
        ]
        let userDomain: String = "mariostsekis.hubat.net"
        let urlToConnect = "https://databuyer.hubat.net/api/v2/offersWithClaims"
        let expectationTest = expectation(description: "Getting available Data Offers...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(dataOffers: [DataOfferObject], newToken: String?) {
            
            XCTAssert(!dataOffers.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: DataPlugError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATDataOffersService.getAvailableDataOffers(userDomain: userDomain, applicationToken: "", merchants: nil, succesfulCallBack: completion, failCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testClaimDataOffer() {
        
        let body: [String: Any] = [
                "dataDebitId": "123"
            ]
        let userDomain: String = "mariostsekis.hubat.net"
        let offerID: String = "123"
        let urlToConnect = "https://databuyer.hubat.net/api/v2/offer/\(offerID)/claim"
        let expectationTest = expectation(description: "Claiming Data Offer...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(status: String, newToken: String?) {
            
            XCTAssert(status == "123")
            expectationTest.fulfill()
        }
        
        func failed(error: DataPlugError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATDataOffersService.claimOffer(userDomain: userDomain, applicationToken: "", offerID: "123", succesfulCallBack: completion, failCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testRedeemDataOffer() {
        
        let body: [String: Any] = [
            "message": "redeemed"
        ]
        let userDomain: String = "mariostsekis.hubat.net"
        let urlToConnect = "https://databuyer.hubat.net/api/v2/user/redeem/cash"
        let expectationTest = expectation(description: "Redeeming Data Offer...")
        
        MockingjayProtocol.addStub(matcher: http(.get, uri: urlToConnect), builder: json(body))
        
        func completion(status: String, newToken: String?) {
            
            XCTAssert(status == "redeemed")
            expectationTest.fulfill()
        }
        
        func failed(error: DataPlugError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATDataOffersService.redeemOffer(userDomain: userDomain, appToken: "", succesfulCallBack: completion, failCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testGetMerchants() {
        
        let body: [[String: Any]] = [
            [
            "data": [
                "merchants": [
                    "1",
                    "2"
                    ]
                ]
            ]
        ]
        let userDomain: String = "mariostsekis.hubat.net"
        let urlToConnect = "https://\(userDomain)/api/v2/data/dex/databuyer"
        let expectationTest = expectation(description: "Getting available merchants...")
        
        MockingjayProtocol.addStub(matcher: everything, builder: json(body))
        
        func completion(merchants: [String], newToken: String?) {
            
            XCTAssert(!merchants.isEmpty)
            expectationTest.fulfill()
        }
        
        func failed(error: DataPlugError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        HATDataOffersService.getMerchants(userToken: "", userDomain: userDomain, succesfulCallBack: completion, failCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testClaimAndEnableOffer() {
        
        let tokenRepsonse: [String: Any] = ["accessToken": "token"]
        let claimOfferResponse: [String: Any] = ["dataDebitId": "123"]
        let checkIfDebitEnabledResponse: [String: Any] =
            [
                "dataDebitKey": "92e4a135-cd81-4c5e-bbf8-57bea3b7d9e0",
                "dateCreated": "2018-01-11T13:29:02+0000",
                "client": [
                    "userId": "92e4a135-cd81-4c5e-bbf8-57bea3b7d9e0",
                    "email": "share-your-notables-2",
                    "pass": "$2a$12$Xq/.xwu.PBlkZBpbvdPv8eibOxQ6G5Ml7NOsR435Ub9iH4Z4RtalW",
                    "name": "Share your Notables",
                    "role": "validate",
                    "roles": []
                ],
                "bundles": [
                    [
                        "dateCreated": "2018-01-11T13:29:02+0000",
                        "startDate": "2018-01-11T13:29:28+0000",
                        "endDate": "2018-04-11T13:29:28+0000",
                        "rolling": false,
                        "enabled": true,
                        "bundle": [
                            "name": "notablesapp",
                            "bundle": [
                                "profile": [
                                    "endpoints": [
                                        [
                                            "endpoint": "rumpel/profile",
                                            "mapping": [
                                                "name": "personal.preferredName",
                                                "nick": "personal.nickName",
                                                "photo_url": "photo.avatar"
                                            ],
                                            "filters": [
                                                [
                                                    "field": "shared",
                                                    "operator": [
                                                        "value": true,
                                                        "operator": "contains"
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ],
                                    "orderBy": "dateCreated",
                                    "ordering": "descending",
                                    "limit": 1
                                ],
                                "notables": [
                                    "endpoints": [
                                        [
                                            "endpoint": "rumpel/notablesv1",
                                            "filters": [
                                                [
                                                    "field": "shared",
                                                    "operator": [
                                                        "value": true,
                                                        "operator": "contains"
                                                    ]
                                                ]
                                            ]
                                        ]
                                    ],
                                    "orderBy": "updated_time",
                                    "ordering": "descending"
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        let enableDebitResponse: [String] = ["enabled"]
        let getOffersResponse: [[String: Any]] = [
            [
                "id": "97a0748f-bf81-4aaa-8f39-97ac2557d920",
                "created": "2017-12-11T13:49:59.022Z",
                "merchantCode": "databuyerpublic",
                "title": "Location testing offer (round 2)",
                "shortDescription": "Gimme locations",
                "longDescription": "Test test test",
                "illustrationUrl": "https://avatars3.githubusercontent.com/u/9696080?s=400&v=4",
                "starts": "2017-12-11T00:00:00.000Z",
                "expires": "2018-06-01T00:00:00.000Z",
                "collectFor": 1,
                "requiredDataDefinition": [
                    "name": "97a0748f-bf81-4aaa-8f39-97ac2557d920",
                    "bundle": [
                        "iphone/locations": [
                            "endpoints": [
                                [
                                    "endpoint": "iphone/locations",
                                    "mapping": [
                                        "accuracy": "accuracy",
                                        "latitude": "latitude",
                                        "longitude": "longitude",
                                        "timestamp": "timestamp",
                                        "lastUpdated": "lastUpdated",
                                        "locations.accuracy": "locations.accuracy",
                                        "locations.latitude": "locations.latitude",
                                        "locations.longitude": "locations.longitude",
                                        "locations.timestamp": "locations.timestamp"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ],
                        "rumpel/locations/ios": [
                            "endpoints": [
                                [
                                    "endpoint": "rumpel/locations/ios",
                                    "mapping": [
                                        "speed": "speed",
                                        "course": "course",
                                        "altitude": "altitude",
                                        "latitude": "latitude",
                                        "longitude": "longitude",
                                        "dateSynced": "dateSynced",
                                        "dateCreated": "dateCreated",
                                        "dateCreatedLocal": "dateCreatedLocal",
                                        "verticalAccuracy": "verticalAccuracy",
                                        "horizontalAccuracy": "horizontalAccuracy"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ]
                    ]
                ],
                "requiredMinUser": 2,
                "requiredMaxUser": 100,
                "totalUserClaims": 7,
                "pii": false,
                "reward": [
                    "currency": "gbp",
                    "value": 1,
                    "rewardType": "cash"
                ],
                "owner": [
                    "id": "055a88b2-d45f-4e46-a561-b7d805f9d19b",
                    "email": "augustinas.markevicius@hatdex.org",
                    "nick": "Gus",
                    "firstName": "Augustinas",
                    "lastName": "Markevicius"
                ],
                "claim": [
                    "dateCreated": "2018-01-02T15:23:02.073Z",
                    "status": "claimed",
                    "confirmed": false,
                    "dataDebitId": "97a0748f-bf81-4aaa-8f39-97ac2557d920"
                ]
            ],
            [
                "id": "a297bb0c-dcc5-44b6-9a22-a0b94500209b",
                "created": "2017-10-13T10:27:16.935Z",
                "merchantCode": "databuyerpublic",
                "title": "Gimme yarr location",
                "shortDescription": "Test offer",
                "longDescription": "Accept only if testing.",
                "illustrationUrl": "https://www.synopsys.com/content/dam/synopsys/sig-assets/icons/SAST_orig.jpg.imgw.850.x.jpg",
                "starts": "2017-10-13T00:00:00.000Z",
                "expires": "2017-11-12T00:00:00.000Z",
                "collectFor": 1,
                "requiredDataDefinition": [
                    "name": "a297bb0c-dcc5-44b6-9a22-a0b94500209b",
                    "bundle": [
                        "iphone/locations": [
                            "endpoints": [
                                [
                                    "endpoint": "iphone/locations",
                                    "mapping": [
                                        "accuracy": "accuracy",
                                        "latitude": "latitude",
                                        "longitude": "longitude",
                                        "timestamp": "timestamp",
                                        "lastUpdated": "lastUpdated",
                                        "locations.accuracy": "locations.accuracy",
                                        "locations.latitude": "locations.latitude",
                                        "locations.longitude": "locations.longitude",
                                        "locations.timestamp": "locations.timestamp"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ]
                    ]
                ],
                "requiredMinUser": 1,
                "requiredMaxUser": 444,
                "totalUserClaims": 6,
                "pii": false,
                "reward": [
                    "currency": "gbp",
                    "value": 3,
                    "rewardType": "cash"
                ],
                "owner": [
                    "id": "055a88b2-d45f-4e46-a561-b7d805f9d19b",
                    "email": "augustinas.markevicius@hatdex.org",
                    "nick": "Gus",
                    "firstName": "Augustinas",
                    "lastName": "Markevicius"
                ],
                "claim": [
                    "dateCreated": "2017-10-13T10:31:09.785Z",
                    "status": "claimed",
                    "confirmed": false,
                    "dataDebitId": "a297bb0c-dcc5-44b6-9a22-a0b94500209b"
                ]
            ],
            [
                "id": "316ec4c9-ca17-42e6-8408-c78a7650aab8",
                "created": "2017-10-12T09:12:12.288Z",
                "merchantCode": "databuyerpublic",
                "title": "Multiple endpoint test",
                "shortDescription": "Accept this offer only if testing",
                "longDescription": "Testing offer",
                "illustrationUrl": "https://www.synopsys.com/content/dam/synopsys/sig-assets/icons/SAST_orig.jpg.imgw.850.x.jpg",
                "starts": "2017-10-12T00:00:00.000Z",
                "expires": "2017-11-11T00:00:00.000Z",
                "collectFor": 1,
                "requiredDataDefinition": [
                    "name": "316ec4c9-ca17-42e6-8408-c78a7650aab8",
                    "bundle": [
                        "twitter/tweets": [
                            "endpoints": [
                                [
                                    "endpoint": "twitter/tweets",
                                    "mapping": [
                                        "id": "id",
                                        "lang": "lang",
                                        "text": "text",
                                        "source": "source",
                                        "user.id": "user.id",
                                        "favorited": "favorited",
                                        "retweeted": "retweeted",
                                        "truncated": "truncated",
                                        "tweets.id": "tweets.id",
                                        "user.lang": "user.lang",
                                        "user.name": "user.name",
                                        "created_at": "created_at",
                                        "lastUpdated": "lastUpdated",
                                        "tweets.lang": "tweets.lang",
                                        "tweets.text": "tweets.text",
                                        "retweet_count": "retweet_count",
                                        "tweets.source": "tweets.source",
                                        "favorite_count": "favorite_count",
                                        "tweets.user.id": "tweets.user.id",
                                        "tweets.place.id": "tweets.place.id",
                                        "quoted_status_id": "quoted_status_id",
                                        "tweets.favorited": "tweets.favorited",
                                        "tweets.place.url": "tweets.place.url",
                                        "tweets.retweeted": "tweets.retweeted",
                                        "tweets.truncated": "tweets.truncated",
                                        "tweets.user.lang": "tweets.user.lang",
                                        "tweets.user.name": "tweets.user.name",
                                        "user.screen_name": "user.screen_name",
                                        "tweets.created_at": "tweets.created_at",
                                        "tweets.place.name": "tweets.place.name",
                                        "user.listed_count": "user.listed_count",
                                        "possibly_sensitive": "possibly_sensitive",
                                        "user.friends_count": "user.friends_count",
                                        "in_reply_to_user_id": "in_reply_to_user_id",
                                        "user.statuses_count": "user.statuses_count",
                                        "tweets.place.country": "tweets.place.country",
                                        "tweets.retweet_count": "tweets.retweet_count",
                                        "user.followers_count": "user.followers_count",
                                        "in_reply_to_status_id": "in_reply_to_status_id",
                                        "tweets.favorite_count": "tweets.favorite_count",
                                        "user.favourites_count": "user.favourites_count",
                                        "tweets.place.full_name": "tweets.place.full_name",
                                        "in_reply_to_screen_name": "in_reply_to_screen_name",
                                        "tweets.place.place_type": "tweets.place.place_type",
                                        "tweets.quoted_status_id": "tweets.quoted_status_id",
                                        "tweets.user.screen_name": "tweets.user.screen_name",
                                        "tweets.user.listed_count": "tweets.user.listed_count",
                                        "tweets.place.country_code": "tweets.place.country_code",
                                        "tweets.possibly_sensitive": "tweets.possibly_sensitive",
                                        "tweets.user.friends_count": "tweets.user.friends_count",
                                        "tweets.in_reply_to_user_id": "tweets.in_reply_to_user_id",
                                        "tweets.user.statuses_count": "tweets.user.statuses_count",
                                        "tweets.user.followers_count": "tweets.user.followers_count",
                                        "tweets.in_reply_to_status_id": "tweets.in_reply_to_status_id",
                                        "tweets.user.favourites_count": "tweets.user.favourites_count",
                                        "tweets.in_reply_to_screen_name": "tweets.in_reply_to_screen_name"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ],
                        "iphone/locations": [
                            "endpoints": [
                                [
                                    "endpoint": "iphone/locations",
                                    "mapping": [
                                        "accuracy": "accuracy",
                                        "latitude": "latitude",
                                        "longitude": "longitude",
                                        "timestamp": "timestamp",
                                        "lastUpdated": "lastUpdated",
                                        "locations.accuracy": "locations.accuracy",
                                        "locations.latitude": "locations.latitude",
                                        "locations.longitude": "locations.longitude",
                                        "locations.timestamp": "locations.timestamp"
                                    ],
                                    "filters": []
                                ]
                            ]
                        ]
                    ]
                ],
                "requiredMinUser": 1,
                "requiredMaxUser": 444,
                "totalUserClaims": 5,
                "pii": false,
                "reward": [
                    "currency": "gbp",
                    "value": 55,
                    "rewardType": "cash"
                ],
                "owner": [
                    "id": "055a88b2-d45f-4e46-a561-b7d805f9d19b",
                    "email": "augustinas.markevicius@hatdex.org",
                    "nick": "Gus",
                    "firstName": "Augustinas",
                    "lastName": "Markevicius"
                ],
                "claim": [
                    "dateCreated": "2017-10-13T12:34:18.398Z",
                    "status": "claimed",
                    "confirmed": false,
                    "dataDebitId": "316ec4c9-ca17-42e6-8408-c78a7650aab8"
                ]
            ]
        ]

        let userDomain: String = "mariostsekis.hubat.net"
        let expectationTest = expectation(description: "Claiming and enabling offer...")

        MockingjayProtocol.addStub(matcher: http(.get, uri: "https://\(userDomain)/users/application_token?name=DataBuyer&resource=https%3A//databuyer.hubat.net/"), builder: json(tokenRepsonse))
        MockingjayProtocol.addStub(matcher: http(.get, uri: "https://databuyer.hubat.net/api/v2/offer/97a0748f-bf81-4aaa-8f39-97ac2557d920/claim"), builder: json(claimOfferResponse))
        MockingjayProtocol.addStub(matcher: http(.get, uri: "https://\(userDomain)/api/v2/data-debit/123"), builder: json(checkIfDebitEnabledResponse))
        MockingjayProtocol.addStub(matcher: http(.get, uri: "https://\(userDomain)/api/v2/data-debit/123/enable"), builder: json(enableDebitResponse))
        MockingjayProtocol.addStub(matcher: http(.get, uri: "https://databuyer.hubat.net/api/v2/offersWithClaims"), builder: json(getOffersResponse))

        func completion(dataOffer: DataOfferObject, newToken: String?) {
            
            XCTAssert(dataOffer.dataOfferID == "97a0748f-bf81-4aaa-8f39-97ac2557d920")
            expectationTest.fulfill()
        }
        
        func failed(error: DataPlugError) {
            
            XCTFail()
            expectationTest.fulfill()
        }
        
        var dataOffer = DataOfferObject()
        dataOffer.dataOfferID = "97a0748f-bf81-4aaa-8f39-97ac2557d920"
        
        HATDataOffersService.claimOfferWrapper(
            offer: dataOffer,
            userDomain: userDomain,
            userToken: "",
            merchants: [],
            succesfulCallBack: completion,
            failCallBack: failed)
        
        waitForExpectations(timeout: 10) { error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}