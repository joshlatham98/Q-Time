import UIKit
import MapKit

class MainViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet var mapView: MKMapView!
   
    let park = "thorpe"
    Let loader = LocationLoader()
    var annotations = [ParkAnnotation]()
    

  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.delegate = self
    mapView.userTrackingMode = MKUserTrackingMode.follow
    
    
    loader.loadLocations(for: park) {
        annotations in
        self.annotations = annotations
        self.mapView.addAnnotation(annotations)
    }
    
  }
    
}

extension MainViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? ParkAnnotation else {return}
        print(annotation.distance(from: CLLocation(latitude: 0, longitude: 0)))
    }
}
