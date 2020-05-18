//
//  OrderRequest+CoreDataProperties.swift
//  
//
//  Created by Rajesh M on 16/05/20.
//
//

import Foundation
import CoreData


extension OrderRequest {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderRequest> {
        return NSFetchRequest<OrderRequest>(entityName: "OrderRequest")
    }

    @NSManaged public var message: String?
    @NSManaged public var request_id: Int32
    @NSManaged public var relationship: Order?

}
