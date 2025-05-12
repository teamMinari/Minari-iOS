protocol BaseRequest: Encodable {
    var params: [String: Any] { get }
}

extension BaseRequest {
    func makeParams(excluding: [String] = []) -> [String: Any] {
        var params = [String: Any]()
        
        Mirror(reflecting: self).children.forEach { children in
            if let label = children.label,
               !excluding.contains(label) {
                params.updateValue(children.value, forKey: label)
            }
        }
        
        return params
    }
    
    var params: [String: Any] {
        makeParams()
    }
}
