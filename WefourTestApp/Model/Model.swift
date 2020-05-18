//
//  Model.swift
//  WefourTestApp
//
//  Created by Rajesh M on 16/05/20.
//  Copyright © 2020 Rajesh M. All rights reserved.
//

import Foundation

let response = """

{
    "message": "New request Created!",
    "request_id": 15,
    "order": {
        "order_id": "403",
        "delivery_to": "CUSTOMER",
        "warehouse_lat": "12.985330",
        "warehouse_lng": "80.120338",
        "customer_name": "test",
        "customer_mobile": "8765432345",
        "customer_lat": "12.922915",
        "customer_lng": "80.127457",
        "product_name": "test",
        "product_qty": "12",
        "product_weight": "25",
        "payment_status": "paid",
        "delivery_method": "FAST",
        "warehouse_address": "Anakaputhur",
        "customer_address": "Tambaram",
        "product_width": "120",
        "product_height": "120",
        "service_type": 1,
        "tracking_id": 1952574829,
        "otp": 2656,
        "route_key": "_egnAgo_hNCWDe@BSj@DrAFlAD|A@fFJbDJ~FNbBHlC\\pWtEdMzBnCTrADdEKnFOlGM\\AzA?|BK~AIzBG|JQjKS`EKvEE|EF~GDnHLnCLp@Jx@N`Bf@p@XrAt@p@b@b@b@r@r@d@l@rAfChBD|Gh@xO~@~Gb@`ERrI`@lBFt@PdAb@^XVV`@l@P`@TTPPv@XfBv@r@^~@\\XJx@RfBHb@BdCVzDb@hCZxEt@|@Rt@Hj@?hCZ~@J^AbC]x@?`@FrJzBVFBFh@I|Du@dASj@Qn@bAbBA~B@bA@pGV`E`@x@cJj@}FH_Aa@k@CWDGHKNGT@Ze@L_@TsA`@uCh@uDN{BDiELiBJoC`@eUBuCVgMR?",
        "status": "ORDERED",
        "user_id": 1,
        "current_provider_id": 0,
        "id": 15
    }
}

"""
 struct ORderReuest: Codable {
    
    var message: String?
    
    var request_id: Int32?
    
    var order: OrDer?
    
}


 struct OrDer: Codable {
    
    var order_id: String
    var delivery_to: String
    var warehouse_lat: String?
    var warehouse_lng: String?
    var customer_name: String
    var customer_mobile: String?
    var customer_lat: String?
    var customer_lng: String
    var product_name: String
    var product_qty: String?
    var product_weight: String?
    var payment_status: String?
    var delivery_method: String?
    var warehouse_address: String?
    var customer_address: String?
    var product_width: String?
    var product_height: String?
    var service_type: Int32?
    var tracking_id: Int32?
    var otp: Int32?
    var route_key: String?
    var status: String?
    var current_provider_id: Int32?
    var user_id: Int32?
    var id: Int32?

}
