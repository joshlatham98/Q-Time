import UIKit
import MapKit

class MainViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
   
    let park = "thorpe"
    let loader = LocationLoader()
    var annotations = [ParkAnnotation]()
    

  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    
    
    
    loader.loadLocations(for: park) { annotations in
        self.annotations = annotations
        self.mapView.addAnnotation(annotations as! MKAnnotation)
    }
    
  }
    
}

extension MainViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? ParkAnnotation else {return}
        print(annotation.distance(from: CLLocation(latitude: 0, longitude: 0)))
    }
}
