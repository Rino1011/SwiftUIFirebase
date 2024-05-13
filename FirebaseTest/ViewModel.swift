//
//  ViewModel.swift
//  FirebaseTest
//
//  Created by 伊藤璃乃 on 2024/05/14.
//

import FirebaseFirestore

class UserViewModel: ObservableObject {
    private var db = Firestore.firestore()

    func saveUser(name: String, completion: @escaping (Error?) -> Void) {
        let docRef = db.collection("users").document()
        
        let user = User(id: docRef.documentID, name: name, createdAt: Timestamp())
        
        docRef.setData([
            "id": user.id,
            "name": user.name,
            "createdAt": user.createdAt
        ]) { error in
            completion(error)
        }
    }
}
