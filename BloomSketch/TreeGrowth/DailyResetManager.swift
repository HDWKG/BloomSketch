//
//  DailyResetManager.swift
//  BloomSketch
//
//  Created by MacBook Pro on 01/06/24.
//

import Foundation
import SwiftData

@MainActor
class DailyResetManager: ObservableObject {
    private var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        scheduleDailyReset()
    }

    private func scheduleDailyReset() {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: Date())
        components.hour = 0 // Set custom hour
        components.minute = 0
        
        let resetDate = calendar.date(from: components)!
        
        let timer = Timer(fireAt: resetDate, interval: 86400, target: self, selector: #selector(resetDailyDone), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: .common)
    }

    @objc private func resetDailyDone() {
        let fetchDescriptor = FetchDescriptor<Tree>()
        do {
            let trees = try modelContext.fetch(fetchDescriptor)
            for tree in trees {
                tree.dailyDone = false
            }
            saveContext()
        } catch {
            print("Failed to fetch trees: \(error)")
        }
    }

    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
