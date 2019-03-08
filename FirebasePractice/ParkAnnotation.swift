import MapKit
import Firebase

class ParkAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var time: Double?
    
    init(data: DocumentSnapshot) {
        title = data["title"] as? String
        let geoPoint = data["a"] as! GeoPoint
        coordinate = geoPoint.coord
        time = data[time] as? Double
    }
    
    func distance(from userLocation: CLLocation) -> CLLocationDistance {
        return userLocation.distance(from:CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude))
    }
}
