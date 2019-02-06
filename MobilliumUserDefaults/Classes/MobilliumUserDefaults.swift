//
//  MobilliumUserDefaults.swift
//  MobilliumUserDefaults
//
//  Created by Mehmet Salih Aslan on 6.02.2019.
//

import Foundation

public var Defaults = UserDefaults.standard

public extension UserDefaults {
    
    /// Removes a values using 'keys'
    func remove(_ keys: [Key<Any>]) {
        for key in keys {
            removeObject(forKey: key.key)
            
        }
        synchronize()
    }
    
    /// Removes all values from user defaults
    func removeAll() {
        for (key, _) in dictionaryRepresentation() {
            removeObject(forKey: key)
        }
        synchronize()
    }
    
}
