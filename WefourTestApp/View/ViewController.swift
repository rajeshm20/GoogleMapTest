//
//  ViewController.swift
//  WefourTestApp
//
//  Created by Rajesh M on 15/05/20.
//  Copyright © 2020 Rajesh M. All rights reserved.
//

import UIKit
import CoreData
import GoogleMaps


class ViewController: UIViewController, GMSMapViewDelegate {
    
    let viewModel = ViewModel()
    var orderRequests = [ORderReuest]()
    var order: [NSManagedObject] = []
    var orderRequest: [NSManagedObject] = []
    var mapView = GMSMapView()
    let wareHouse = GMSMarker()
    let pod = GMSMarker()
    let segueIdentifier = "toCustomerDetails"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let camera = GMSCameraPosition.camera(withLatitude: 12.985330, longitude: 80.120338, zoom: 12.0)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view = mapView
        mapView.delegate = self
        
        orderRequests = viewModel.parseJSON(filename: "neworder")!
        
        debugPrint("orderReuest: ", orderRequests)
        
        self.save()
        
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        // Fetch saved order-request data from core data	
        let managedContext = appdelegate.persistentContainer.viewContext
        
        let orderReqFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "OrderRequest")
        let orderFetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Order")
        
        do {
            
            orderRequest = try managedContext.fetch(orderReqFetchRequest)
            order = try managedContext.fetch(orderFetchRequest)
            let fOrder = order[0]
            
            // warehouse coordinates
            let wLat = (fOrder.value(forKeyPath: "warehouse_lat") as! NSString).doubleValue
            let wlng = (fOrder.value(forKeyPath: "warehouse_lng") as! NSString).doubleValue
            
            // customer coordinates
            let cLat = (fOrder.value(forKeyPath: "customer_lat") as! NSString).doubleValue
            let cLng = (fOrder.value(forKeyPath: "customer_lng") as! NSString).doubleValue
            
            // routes
            let route = fOrder.value(forKeyPath: "route_key")
            debugPrint("check type: ",cLng , type(of: cLng))
            
            //
            let wareHouseCoord = CLLocation(latitude: wLat, longitude: wlng)
            let currentLocCoord = CLLocation(latitude: cLat, longitude: cLng)
            
            
            // marker for warehouse address
            let warAddress = fOrder.value(forKeyPath: "warehouse_address") as! String
            wareHouse.position = wareHouseCoord.coordinate
            wareHouse.appearAnimation = .pop
            wareHouse.title = "Ware House"
            wareHouse.snippet = "Address: \(warAddress)"
            wareHouse.map = mapView
            
            // marker for customer / place of delivery address
            let cusName =  fOrder.value(forKeyPath: "customer_name") as! String
            let cusAddress =  fOrder.value(forKeyPath: "customer_address") as! String
            
            pod.isTappable = true
            pod.appearAnimation = .pop
            pod.position = currentLocCoord.coordinate
            pod.title = "\(cusName)"
            pod.snippet = "Address:\(cusAddress) "
            pod.map = mapView
            //            _ = self.mapView(mapView: mapView, didTapMarker: pod)
            
            //            toCustomerDetailsPage(sender: pod)
            // draw route
            viewModel.drawPath(from: route as! String, mapView: mapView)
            
        } catch let error as NSError {
            
            debugPrint("coud not retreive \(error), \(error.userInfo)")
        }
    }
    
    
    // Google map Delegate methods
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        debugPrint("pod marker info window tapped")
//        if marker.title == "test" {
//            self.performSegue(withIdentifier: self.segueIdentifier, sender: marker)
//        }
        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("market tapped: \(String(describing: marker.title))")
        if marker.title == "test" {
            self.performSegue(withIdentifier: self.segueIdentifier, sender: marker)
        }
        return true
    }
    
    // save the parsed data to core data
    func save(){
        
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        for orderReq in orderRequests {
            let managedContext = appdelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Order", in: managedContext)!
            let entity1 = NSEntityDescription.entity(forEntityName: "OrderRequest", in: managedContext)!
            let orderRequest = OrderRequest(entity: entity1, insertInto: managedContext)
            
            let order = Order(entity: entity, insertInto: managedContext)
            order.current_provider_id = (orderReq.order?.current_provider_id) ?? 0
            order.customer_address = (orderReq.order?.customer_address)!
            order.customer_lat = (orderReq.order?.customer_lat)!
            order.customer_lng = (orderReq.order?.customer_lng)!
            order.customer_mobile = (orderReq.order?.customer_mobile)!
            order.customer_name = (orderReq.order?.customer_name)!
            order.delivery_method = (orderReq.order?.delivery_method)!
            order.delivery_to = (orderReq.order?.delivery_to)!
            order.id = (orderReq.order?.id)!
            order.order_id = (orderReq.order?.order_id)
            order.otp = ((orderReq.order?.otp)!)
            order.payment_status = (orderReq.order?.payment_status)
            order.product_height = (orderReq.order?.product_height)
            order.product_name = (orderReq.order?.product_name)
            order.product_qty = (orderReq.order?.product_qty)
            order.product_weight = (orderReq.order?.product_weight)
            order.product_width = (orderReq.order?.product_width)
            order.route_key = (orderReq.order?.route_key)
            order.service_type = ((orderReq.order?.service_type)!)
            order.status = (orderReq.order?.status)
            order.tracking_id = ((orderReq.order?.tracking_id)!)
            order.user_id = ((orderReq.order?.user_id)!)
            order.warehouse_address = (orderReq.order?.warehouse_address)
            order.warehouse_lat = (orderReq.order?.warehouse_lat)
            order.warehouse_lng = (orderReq.order?.warehouse_lng)
            
            orderRequest.message = orderReq.message
            orderRequest.request_id = orderReq.request_id ?? 0
            orderRequest.relationship?.current_provider_id = order.relationship!.request_id
            
            do {
                try managedContext.save()
                self.order.append(order)
                self.orderRequest.append(orderRequest)
                debugPrint("data saved to core data")
            } catch let error as NSError {
                debugPrint("Could not save, \(error), \(error.userInfo)")
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as! CustomerDetailsViewController
        destinationVC.orders = order
        destinationVC.orderRequests = orderRequest
        
    }
    
}


