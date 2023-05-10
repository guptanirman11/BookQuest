//
//  networkMonitor.swift
//  BookQuest
//
//  Created by Anshul Gupta on 04/03/23.
//

import Foundation
import Network
class NetworkMonitor: ObservableObject {
    let networkMonitor = NWPathMonitor()
    let workerQueue = DispatchQueue(label: "Monitor")
    @Published var isConnected = true

    init() {
        networkMonitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {self.isConnected = path.status == .satisfied

            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
