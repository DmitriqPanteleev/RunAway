//
//  CommonLogger.swift
//  away
//
//  Created by Дмитрий Пантелеев on 09.07.2024.
//

import Foundation
import OSLog

final class CommonLogger {
    // MARK: Dependencies
    private let isSystemLogsEnabled: Bool
    
    // MARK: Internal properties
    private let messagePrefix = "[\(DateFormatters.shortDateTime.string(from: Date()))] AWAY | "
    private let queue = DispatchQueue(label: "logger.away.com", qos: .utility, attributes: .concurrent)
    
    init(isSystemLogsEnabled: Bool) {
        self.isSystemLogsEnabled = isSystemLogsEnabled
    }
}

extension CommonLogger: Recordable {
    func log(message: String) {
        queue.async { [weak self] in
            guard let self = self else { return }
            
            print("\(messagePrefix)\(message)")
            
            if self.isSystemLogsEnabled {
                os_log(.debug, "%{public}%{public}", messagePrefix, message)
            }
        }
    }
    
    func log(error: Error) {
        queue.async { [weak self] in
            guard let self = self else { return }
            
            print("\(messagePrefix)\(error.localizedDescription)")
            
            if self.isSystemLogsEnabled {
                os_log(.debug, "%{public}%{public}", messagePrefix, error.localizedDescription)
            }
        }
    }
}
