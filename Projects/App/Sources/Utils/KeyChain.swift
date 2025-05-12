import SwiftUI

class KeyChain {
    
    private static let key = "CFDToken"
    private static let service = Bundle.main.bundleIdentifier!
    
    static func create(token: SigninResponse) -> Bool {
        guard let data = try? JSONEncoder().encode(token) else {
            return false
        }
        
        let query: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData: data
        ]
        
        
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == -25299 {
            if self.delete() {
                return false
            }
        }
        
        return status == errSecSuccess
        
        
    }
    
    static func read() -> SigninResponse? {
        let query: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue as Any
        ]
        
        var itemCopy: CFTypeRef?
        
        let status = SecItemCopyMatching(query as CFDictionary, &itemCopy)
        
        if status == errSecSuccess {
            let retrievedData = itemCopy as! Data
            let value = try? JSONDecoder().decode(SigninResponse.self, from: retrievedData)
            return value
        } else {
            return nil
        }
    }
    
    static func update(token: SigninResponse) -> Bool {
        
        guard let data = try? JSONEncoder().encode(token) else {
            print("s")
            return false
        }
        
        let beforeQuery: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
        ]
        
        let updatedQuery: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData: data
        ]
        
        let status = SecItemUpdate(beforeQuery as CFDictionary, updatedQuery as CFDictionary)
        
        return status == errSecSuccess
        
        
    }
    
    static func delete() -> Bool {
        let query: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]
        
        return SecItemDelete(query as CFDictionary) == errSecSuccess
    }
}
