import Firebase


class LocationLoader {
    
    func loadLocations(for park: String, completion: @escaping ([ParkAnnotation]) -> Void) {
      var locations = [ParkAnnotation]()
    
    let ref = Firestore.firestore().collection("parks").document(park).collection("locations")
    ref.getDocuments { snapshot, error in
    if let documents = snapshot?.documents {
    for document in documents {
    let annotation = ParkAnnotation(data: document)
    locations.append(annotation)
    }
        completion(locations)
    }
    
    
    }
    
    
    
    
    
}
}
