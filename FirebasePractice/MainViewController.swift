import UIKit
import MapKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
   
    let park = "thorpe"
    let loader = LocationLoader()
    var annotations = [ParkAnnotation]()
    

  override func viewDidLoad() {
    super.viewDidLoad()
    print("hello")
    
    //mapView.delegate = self
    
    
    
      loader.loadLocations(for: park) { annotations in
      self.annotations = annotations
      self.mapView.addAnnotations(annotations)
    }
    
  }
}
    


extension MainViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? ParkAnnotation else { return }
        print(annotation.distance(from: CLLocation(latitude: 0, longitude: 0)))
    }
}
