//
//  UserRepository.swift
//  Mock
//
//  Created by b.belotserkovtsev on 29.07.2022.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUser()
    func fetchConfigs()
    func fetchRemoteCache()
}

final class UserRepository: UserRepositoryProtocol {
    func fetchUser() {
        let queue = OperationQueue()
        queue.qualityOfService = .userInitiated

        let getUserRightsOperation = BlockOperation()
        let getUserOperation = BlockOperation()

        getUserRightsOperation.addDependency(getUserOperation)

        getUserRightsOperation.addExecutionBlock {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("🟥 getUserRightsOperation async task")
            }
        }

        getUserOperation.addExecutionBlock {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("🟥 getUserOperation async task")
            }
        }

        queue.addOperation(getUserOperation)
    }

    func fetchConfigs() {
        let queue = DispatchQueue.main
        queue.async {
            for i in 0..<3 {
                print("🟥 get config #\(i)")
            }
        }

        queue.async(flags: .barrier) {
            print("🟥 get dependant configs that require to be executed after first 3")
        }

        queue.async {
            for i in 3..<6 {
                print("🟥 get config #\(i)")
            }
        }
    }

    func fetchRemoteCache() {
        let thread = Thread(target: self, selector: #selector(threadAction), object: nil)
        thread.start()
    }

    @objc private func threadAction() {
        print("🟥 fetchRemoteCache with thread")
    }
}
