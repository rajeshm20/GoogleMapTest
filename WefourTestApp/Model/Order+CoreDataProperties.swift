//
//  Order+CoreDataProperties.swift
//  
//
//  Created by Rajesh M on 16/05/20.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var current_provider_id: Int32
    @NSManaged public var customer_address: String?
    @NSManaged public var customer_lat: String?
    @NSManaged public var customer_lng: String?
    @NSManaged public var customer_mobile: String?
    @NSManaged public var customer_name: String?
    @NSManaged public var delivery_method: String?
    @NSManaged public var delivery_to: String?
    @NSManaged public var id: Int32
    @NSManaged public var order_id: String?
    @NSManaged public var otp: Int32
    @NSManaged public var payment_status: String?
    @NSManaged public var product_height: String?
    @NSManaged public var product_name: String?
    @NSManaged public var product_qty: String?
    @NSManaged public var product_weight: String?
    @NSManaged public var product_width: String?
    @NSManaged public var route_key: String?
    @NSManaged public var service_type: Int32
    @NSManaged public var status: String?
    @NSManaged public var tracking_id: Int32
    @NSManaged public var user_id: Int32
    @NSManaged public var warehouse_address: String?
    @NSManaged public var warehouse_lat: String?
    @NSManaged public var warehouse_lng: String?
    @NSManaged public var relationship: OrderRequest?

}
