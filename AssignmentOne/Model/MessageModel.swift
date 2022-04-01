//
//  MessageModel.swift
//  AssignmentOne
//
//  Created by Zishu Ma on 2022/3/25.
//

import Foundation
import Combine

@MainActor final class MessageModel : ObservableObject {
    @Published var messages : [Message] = []
    private var timeLines : Set<AnyCancellable> = .init()
    
    init(){
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith/tweets")!)
            .map{$0.data}
            .flatMap{ data in
                return Just(data)
                    .decode(type: [Message].self, decoder: JSONDecoder())
                    .catch{ _ in
                        return Just([])
                    }
            }
            .compactMap{
                $0
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                completion in
            }, receiveValue: { value in
                let filtered = value
                    .filter{ msg in
                        return !(msg.content == nil && msg.images == nil)
                    }
                self.messages.removeAll()
                self.messages.append(contentsOf: filtered)
            })
            .store(in: &self.timeLines)
    }
    
}

struct Message : Identifiable, Codable {
    var id : Int
    var content : String?
    var images : [ImageURL]?
    var sender: Sender?
    var comments: [Comment]?
}
