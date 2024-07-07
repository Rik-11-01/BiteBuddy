//
//  AuthViewModel.swift
//  Practice
//
//  Created by Ritik Raman on 04/07/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift



@MainActor
class AuthViewModel: ObservableObject{
    @Published var usersession: FirebaseAuth.User?
    @Published var currentuser:FirebaseUser?
    
    init(){
        self.usersession = Auth.auth().currentUser
        
        Task{
            await fetchuser()
        }
    }
    
    func SignIn(withEmail email:String , password:String )async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.usersession = result.user
            await fetchuser()
        }catch{
            print("DEBUG:: Failed to Log_IN !")
        }
    }
    
    func createuser(withEmail email:String ,password:String,fullname:String ) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.usersession = result.user
            
            let user = FirebaseUser(id: result.user.uid, fullname: fullname, email: email)
            
            let encodeduser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeduser)
            
            await fetchuser()
            
        }catch{
            print("Failed to Create User")
        }
    }
    
    func SignOut(){
        do{
            try Auth.auth().signOut() //sign out user on backened.
            self.usersession = nil // wipes out user session and takes us on login screen.
            self.currentuser = nil //wipes out current user data model
        }catch{
            print("DEBUG:: Failed to sign out \(error.localizedDescription)")
        }
    }
    
    func delete(){
        
    }
    func fetchuser() async{
        guard let uid = Auth.auth().currentUser?.uid else{return}
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        
        self.currentuser = try? snapshot.data(as: FirebaseUser.self)
        
      //  print("Debug::Current user is \(currentuser.self)")
    }
}
