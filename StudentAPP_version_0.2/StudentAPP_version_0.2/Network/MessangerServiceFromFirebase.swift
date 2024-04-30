//
//  MessangerServiceFromFirebase.swift
//  StudentAPP_version_0.2
//
//  Created by Islombek Gofurov on 30/04/24.
//

import Foundation
import Firebase
import FirebaseDatabase

class MessangerServiceFromFirebase: ObservableObject {
    static let shared = MessangerServiceFromFirebase()
    let db: DatabaseReference
    let jobApplicationsRef: DatabaseReference
    let messagesRef: DatabaseReference
    
    init() {
        db = Database.database().reference()
        jobApplicationsRef = db.child("jobApplications")
        messagesRef = db.child("messages")
    }
    
    func getAllChats(completion: @escaping ([JobApplication]) -> Void) {
        jobApplicationsRef.observe(.value) { snapshot in
            var chats: [JobApplication] = []
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let jobApplication = JobApplication(snapshot: child)
                chats.append(jobApplication)
            }
            completion(chats)
        }
    }
    
    func getMessages(forJobApplicationId jobApplicationId: String, completion: @escaping ([Message]) -> Void) {
        let messagesRef = messagesRef.child(jobApplicationId)
        messagesRef.observe(.value) { snapshot in
            var messages: [Message] = []
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                let message = Message(snapshot: child)
                messages.append(message)
            }
            completion(messages)
        }
    }
    
    func startChat(userId: String, companyId: String, vacancyId: String, vacancyName: String, cvId: String, firstMessageText: String?, completion: @escaping (Bool, Error?) -> Void) {
        
        let newJobApplicationRef = jobApplicationsRef.childByAutoId()
        let newJobApplicationId = newJobApplicationRef.key!
        let newMessagesRef = messagesRef.child(newJobApplicationId)
        
        // Создаем запись для новой заявки на работу
        let jobApplicationData = [
            "userId": userId,
            "companyId": companyId,
            "vacancyId": vacancyId,
            "vacancyName": vacancyName,
            "cvId": cvId,
            "status": "open"  // предполагаем, что статус открыт с начала
        ]
        
        newJobApplicationRef.setValue(jobApplicationData) { error, _ in
            if let error = error {
                completion(false, error)
                return
            }
            // Опционально: добавляем первое сообщение, если текст сообщения предоставлен
            if let text = firstMessageText {
                let timestamp = Int(Date().timeIntervalSince1970 * 1000)  // текущее время в миллисекундах
                let firstMessageData = [
                    "senderId": userId,
                    "text": text,
                    "timestamp": timestamp
                ] as [String : Any]
                print(6)
                newMessagesRef.childByAutoId().setValue(firstMessageData) { error, _ in
                    if let error = error {
                        completion(false, error)
                    } else {
                        completion(true, nil)
                    }
                }
            } else {
                completion(true, nil)
            }
        }
    }
    
    func sendMessage(toJobApplicationId: String, text: String, completion: @escaping (Bool, Error?) -> Void) {
        let messagesRef = messagesRef.child(toJobApplicationId)
        let newMessageRef = messagesRef.childByAutoId()
        let timestamp = Int(Date().timeIntervalSince1970 * 1000)
        let messageData = [
            "senderId": "currentUserId", // This should be dynamically set
            "text": text,
            "timestamp": timestamp
        ] as [String : Any]
        newMessageRef.setValue(messageData) { error, _ in
            if let error = error {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
}

class JobApplication: NSObject, Identifiable, ObservableObject {
    let id = UUID()
    var userId: String
    var companyId: String
    var vacancyId: String
    var vacancyName: String
    var status: String
    var cvId: String
    var messages: [Message]
    
    init(snapshot: DataSnapshot) {
        let dict = snapshot.value as! [String: Any]
        userId = dict["userId"] as! String
        companyId = dict["companyId"] as! String
        vacancyId = dict["vacancyId"] as! String
        vacancyName = dict["vacancyName"] as! String
        status = dict["status"] as! String
        cvId = dict["cvId"] as! String
        messages = []
    }
}

class Message: NSObject, Identifiable, ObservableObject {
    let id = UUID()
    var senderId: String
    var text: String
    var timestamp: Date
    
    init(snapshot: DataSnapshot) {
        let dict = snapshot.value as! [String: Any]
        senderId = dict["senderId"] as! String
        text = dict["text"] as! String
        timestamp = Date(timeIntervalSince1970: TimeInterval(dict["timestamp"] as! Int64) / 1000)
    }
}
