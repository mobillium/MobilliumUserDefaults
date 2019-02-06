//
//  Key.swift
//  MobilliumUserDefaults
//
//  Created by Mehmet Salih Aslan on 6.02.2019.
//

import Foundation

public class Key<ValueType>: DefaultsKey {
    
    public var value: ValueType? {
        set {
            /// Saves a 'value' using 'key'
            Defaults.set(newValue, forKey: key)
            Defaults.synchronize()
        }
        get {
            /// Creates a 'value' using 'key'
            return Defaults.object(forKey: key) as? ValueType
        }
    }
    
    let key: String!
    
    public init(key: String) {
        self.key = key
    }
    
    /// Removes a value using 'key'
    public func remove() {
        Defaults.removeObject(forKey: key)
        Defaults.synchronize()
    }
    
    /// Returns `true` if `key` exists
    public var has: Bool {
        return Defaults.object(forKey: key) != nil
    }
    
}
