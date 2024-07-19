//
//  model.swift
//  two
//
//  Created by imac-2626 on 2024/7/18.
//
import RealmSwift
import Foundation


class dog: Object {
    @Persisted var name: String
    @Persisted var say: String
    @Persisted var time: Date
   
}
