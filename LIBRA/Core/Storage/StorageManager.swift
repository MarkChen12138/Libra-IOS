//
//  StorageManager.swift
//  LIBRA
//
//  Created by 好用的电脑 on 2023/10/8.
//

import Foundation
import FirebaseStorage
import UIKit

// StorageManager是一个单例类，负责管理Firebase云存储操作。

final class StorageManager {
    
    // 共享的StorageManager单例实例，确保整个应用中只有一个共享的实例。
    static let shared = StorageManager()
    
    // 私有初始化方法，用于强制实现单例模式。
    private init() { }
    
    // 对Firebase云存储的根引用。
    private let storage = Storage.storage().reference()
    
    // 对Firebase云存储中的"images"文件夹的引用。
    private var imagesReference: StorageReference {
        storage.child("images")
    }
    
    // 基于用户ID构建用户特定的引用。
    private func userReference(userId: String) -> StorageReference {
        storage.child("users").child(userId)
    }
    
    // 获取用于特定路径的StorageReference。
    func getPathForImage(path: String) -> StorageReference {
        Storage.storage().reference(withPath: path)
    }
    
    // 异步获取特定图像路径的URL。
    func getUrlForImage(path: String) async throws -> URL {
        try await getPathForImage(path: path).downloadURL()
    }
    
    // 异步获取特定用户和路径的数据（例如图像数据）。
    func getData(userId: String, path: String) async throws -> Data {
        try await storage.child(path).data(maxSize: 3 * 1024 * 1024)
    }
    
    // 异步获取特定用户和路径的图像。
    func getImage(userId: String, path: String) async throws -> UIImage {
        let data = try await getData(userId: userId, path: path)
        
        guard let image = UIImage(data: data) else {
            throw URLError(.badServerResponse)
        }
        
        return image
    }
    
    // 异步保存用户数据，并返回保存的图像的路径和名称。
    func saveImage(data: Data, userId: String) async throws -> (path: String, name: String) {
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        let path = "\(UUID().uuidString).jpeg"
        let returnedMetaData = try await userReference(userId: userId).child(path).putDataAsync(data, metadata: meta)
        
        guard let returnedPath = returnedMetaData.path, let returnedName = returnedMetaData.name else {
            throw URLError(.badServerResponse)
        }
        
        return (returnedPath, returnedName)
    }
    
    // 异步保存用户图像，并返回保存的图像的路径和名称。
    func saveImage(image: UIImage, userId: String) async throws -> (path: String, name: String) {
        guard let data = image.jpegData(compressionQuality: 1) else {
            throw URLError(.backgroundSessionWasDisconnected)
        }
        
        return try await saveImage(data: data, userId: userId)
    }
    
    // 异步删除特定路径下的图像。
    func deleteImage(path: String) async throws {
        try await getPathForImage(path: path).delete()
    }
}
