//
//  Key.swift
//  MobilliumUserDefaults
//
//  Created by Mehmet Salih Aslan on 6.02.2019.
//

import Foundation

public class Key<ValueType: Codable>: DefaultsKey {
    
    let key: String
    public init(key: String) {
        self.key = key
    }
    
    public var value: ValueType? {
        set {
            self.set(newValue: newValue)
        }
        get {
            self.get()
        }
    }
    
    private func set(newValue: ValueType?) {
        guard newValue != nil else {
            remove()
            return
        }
        if isSwiftCodableType(ValueType.self) || isFoundationCodableType(ValueType.self) {
            Defaults.set(newValue, forKey: key)
            return
        }
        do {
            let encoder = JSONEncoder()
            let encoded = try encoder.encode(newValue)
            Defaults.set(encoded, forKey: key)
            Defaults.synchronize()
        } catch {
            #if DEBUG
            print(error)
            #endif
        }
    }
    
    private func get() -> ValueType? {
        if isSwiftCodableType(ValueType.self) || isFoundationCodableType(ValueType.self) {
            return Defaults.value(forKey: key) as? ValueType
        }
        guard let data = Defaults.data(forKey: key) else {
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
    
    /// Removes a value using 'key'
    public func remove() {
        Defaults.removeObject(forKey: key)
        Defaults.synchronize()
    }
    /// Returns `true` if `key` exists
    public var has: Bool {
        return Defaults.object(forKey: key) != nil
    }
    /// Checks if the specified type is a Codable from the Swift standard library.
    ///
    /// - Parameter type: The type.
    /// - Returns: A boolean value.
    private func isSwiftCodableType<T>(_ type: T.Type) -> Bool {
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
    private func isFoundationCodableType<T>(_ type: T.Type) -> Bool {
        switch type {
        case is Date.Type:
            return true
        default:
            return false
        }
    }
}
