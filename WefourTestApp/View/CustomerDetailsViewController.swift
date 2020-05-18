//
//  CustomerDetailsViewController.swift
//  WefourTestApp
//
//  Created by RNSS on 17/05/20.
//  Copyright © 2020 Rajesh M. All rights reserved.
//

import UIKit
import CoreData

class CustomerDetailsViewController: UIViewController {
    
    @IBOutlet var userProfilePic: UIImageView!
    @IBOutlet var customerNameLabel: UILabel!
    @IBOutlet var customerMobileLabel: UILabel!
    @IBOutlet var customerAddressTextView: UITextView!
    
    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productQty: UILabel!
    @IBOutlet var productWeightLabel: UILabel!
    @IBOutlet var productWidthLabel: UILabel!
    @IBOutlet var productHeightLabel: UILabel!
    
    @IBOutlet var OrderRequestIDLabel: UILabel!
    @IBOutlet var orderIDLabel: UILabel!
    @IBOutlet var deliveryToLabel: UILabel!
    @IBOutlet var paymentStatusLabel: UILabel!
    @IBOutlet var deliveryMethodLabel: UILabel!
    @IBOutlet var serviceTypeLabel: UILabel!
    @IBOutlet var trackingIDLabel: UILabel!
    @IBOutlet var otpLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var userIDLabel: UILabel!
    @IBOutlet var currentProviderIDLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    
    @IBOutlet var contactView: UIView!
    @IBOutlet var productView: UIView!
    @IBOutlet var orderView: UIView!
    
    
    var orders: [NSManagedObject] = []
    var orderRequests: [NSManagedObject] = []
    
    
    override func viewWillLayoutSubviews() {
        
        
        userProfilePic.rounded()
        
        contactView.layer.cornerRadius = 10.0
        contactView.clipsToBounds = true
        productView.layer.cornerRadius = 10.0
        productView.clipsToBounds = true
        orderView.layer.cornerRadius = 10.0
        orderView.clipsToBounds = true
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fOrder = orders[0]
        let fOrderRequest = orderRequests[0]
        let trackId = fOrder.value(forKey: "tracking_id") ?? "no data!"
        debugPrint(trackId)
        debugPrint("checktypeof: ", type(of: trackId))
        customerNameLabel.text = (fOrder.value(forKeyPath: "customer_name") as! String)
        customerMobileLabel.text = (fOrder.value(forKeyPath: "customer_mobile") as! String)
        customerAddressTextView.text = (fOrder.value(forKeyPath: "customer_address") as! String)
        
        productNameLabel.text = "Product Name      : " + (fOrder.value(forKeyPath: "product_name") as! String)
        productQty.text = "Product Qty          : " + (fOrder.value(forKeyPath: "product_qty") as! String)
        productWeightLabel.text = "Product Weight    : " + (fOrder.value(forKeyPath: "product_weight") as! String)
        productWidthLabel.text = "Product width       : " + (fOrder.value(forKeyPath: "product_width") as! String)
        productHeightLabel.text = "Product height     : " + (fOrder.value(forKeyPath: "product_height") as! String)
        
        let reqID = fOrderRequest.value(forKeyPath: "request_id")as! Int32
        OrderRequestIDLabel.text = "\(String(describing: reqID))"
        
        orderIDLabel.text = (fOrder.value(forKeyPath: "order_id") as! String)
        
        deliveryToLabel.text = (fOrder.value(forKeyPath: "delivery_to") as! String)
        paymentStatusLabel.text = (fOrder.value(forKeyPath: "payment_status") as! String)
        deliveryMethodLabel.text = (fOrder.value(forKeyPath: "delivery_method") as! String)
        
        let servType = fOrder.value(forKeyPath: "service_type") as! Int32
        serviceTypeLabel.text = "\(String(describing: servType))"
        
        
        let trackID = fOrder.value(forKeyPath: "tracking_id") as! Int32
        trackingIDLabel.text = "\(String(describing: trackID))"
        
        let otp = fOrder.value(forKeyPath: "otp") as! Int32
        otpLabel.text = "\(String(describing: otp))"
        
        statusLabel.text = (fOrder.value(forKeyPath: "status") as! String)
        let userid = fOrder.value(forKeyPath: "user_id") as! Int32
        userIDLabel.text = "\(String(describing: userid)))"
        
        let provID = fOrder.value(forKeyPath: "current_provider_id") as! Int32
        currentProviderIDLabel.text = "\(String(describing: provID))"
        
        let id = fOrder.value(forKeyPath: "id")
        idLabel.text = "\(String(describing: id))"
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}






