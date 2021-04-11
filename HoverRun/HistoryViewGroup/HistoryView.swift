//
//  HistoryView.swift
//  HoverRun
//
//  Created by Hasnainali Walli on 2020-12-27.
//

import SwiftUI

struct HistoryView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Workout.start, ascending: false)])
    var workouts: FetchedResults<Workout>
    
    var body: some View {
        List{
            ForEach(workouts) { workout in
                NavigationLink(
                    destination: WorkoutDetailsView(currentWorkout: workout)) {
                    WorkoutSummaryView(currentWorkout: workout)
                }
            }.onDelete(perform: deleteWorkouts)
        }
    }
    
    func deleteWorkouts(offsets: IndexSet) {
        withAnimation {
            offsets.map {workouts[$0]}.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let error = error as NSError
                print(error)
            }
        }
    }
    
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
