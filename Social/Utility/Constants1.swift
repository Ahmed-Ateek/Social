import Foundation
import Alamofire
//VC Identifiers
let Get_Car_List = "GetCarListVC"
let Select_Booking_Details_VC = "SelectBookingDetailsVC"
//tyealias
typealias CompletionHandler<T:Decodable> = (_ error:String?,_ code:Int?,T?)->()
typealias CompletionHandlerB = (_ success:Bool?)->()
typealias CompletionHandlerString = (_ VC:UIViewController?)->()
//check internet
struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}
struct GETUDID {
     static let sharesInstance = GETUDID()
    var udid =  UIDevice.current.identifierForVendor?.uuidString ?? "" 
  
}
