//
//  NSPredicate+helper.swift
//  todo
//
//  Created by a.menshikov on 09.07.2021.
//

import Foundation
import CoreData

extension NSPredicate {
    static var all = NSPredicate(format: "TRUEPREDICATE")
    static var none = NSPredicate(format: "FALSEPREDICATE")
}
