//
//  RealmExtension.swift
//  Weather
//
//  Created by User on 06.08.2022.
//

import RealmSwift

extension Realm {
    func writeAsync<T: ThreadConfined>(obj: T, errorHandler: @escaping ((_ error: Swift.Error) -> Void) = { _ in return }, block: @escaping ((Realm, T?) -> Void)) {
        let wrappedObj = ThreadSafeReference(to: obj)
        let config = self.configuration
        DispatchQueue(label: "background").async {
            autoreleasepool {
                do {
                    let realm = try Realm(configuration: config)
                    let obj = realm.resolve(wrappedObj)

                    try realm.write {
                        block(realm, obj)
                    }
                } catch {
                    errorHandler(error)
                }
            }
        }
    }
}
