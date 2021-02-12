//
//  Key.swift
//  MobilliumUserDefaults
//
//  Created by Mehmet Salih Aslan on 6.02.2019.
//

import Foundation

public class Key<ValueType: Codable>: DefaultsKey {
    
    let key: String!
    
    public init(key: String) {
        self.key = key
    }
    
    /// Removes a value using 'key'
    public func remove(_ key: Key<ValueType>) {
        Defaults.set(nil, forKey: key.key)
        Defaults.synchronize()
    }
    
    /// Returns `true` if `key` exists
    public func has(_ key: Key<ValueType>) -> Bool {
        return Defaults.value(forKey: key.key) != nil
    }
    
    /// - Returns: A `ValueType` or nil if the key was not found.
    public func get<ValueType>(for key: Key<ValueType>) -> ValueType? {
        if isSwiftCodableType(ValueType.self) || isFoundationCodableType(ValueType.self) {
            return Defaults.value(forKey: key.key) as? ValueType
        }
        
        guard let data = Defaults.data(forKey: key.key) else {
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(ValueType.self, from: data)
            return decoded
        } catch {
            #if DEBUG
            print(error)
            #endif
        }
        
        return nil
        
    }
    
    /// Sets a value associated with the specified key.
    ///
    /// - Parameters:
    ///   - some: The value to set.
    ///   - key: The associated `Key<ValueType>`.
    public func set<ValueType>(_ value: ValueType, for key: Key<ValueType>) {
        if isSwiftCodableType(ValueType.self) || isFoundationCodableType(ValueType.self) {
            Defaults.set(value, forKey: key.key)
            return
        }
        
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(value)
            Defaults.set(encoded, forKey: key.key)
            Defaults.synchronize()
        } catch {
            #if DEBUG
            print(error)
            #endif
        }
    }
    
    /// Removes given bundle's persistent domain
    ///
    /// - Parameter type: Bundle.
    public func removeAll(bundle : Bundle = Bundle.main) {
        guard let name = bundle.bundleIdentifier else { return }
        Defaults.removePersistentDomain(forName: name)
    }
    
    /// Checks if the specified type is a Codable from the Swift standard library.
    ///
    /// - Parameter type: The type.
    /// - Returns: A boolean value.
    private func isSwiftCodableType<ValueType>(_ type: ValueType.Type) -> Bool {
        switch type {
        case is String.Type, is Bool.Type, is Int.Type, is Float.Type, is Double.Type:
            return true
        default:
            return false
        }
    }
    
    /// Checks if the specified type is a Codable, from the Swift's core libraries
    /// Foundation framework.
    ///
    /// - Parameter type: The type.
    /// - Returns: A boolean value.
    private func isFoundationCodableType<ValueType>(_ type: ValueType.Type) -> Bool {
        switch type {
        case is Date.Type:
            return true
        default:
            return false
        }
    }
    
}
