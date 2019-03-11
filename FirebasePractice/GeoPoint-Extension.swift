import Firebase
import MapKit

extension GeoPoint {
    
    var coord: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(latitude, longitude)
    }
}
