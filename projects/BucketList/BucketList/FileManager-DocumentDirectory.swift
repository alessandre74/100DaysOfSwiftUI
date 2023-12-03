//
//  FileManager-DocumentDirectory.swift
//  BucketList
//
//  Created by Alessandre Livramento on 16/07/23.
//

import Foundation

extension FileManager {
  static var documentDirectory: URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
}
