//
//  ClubViewModel.swift
//  ConnectEDU
//
//  Created by Logan Rohlfs on 2024-03-25.
//

import Foundation

class ClubViewModel: ObservableObject {
    var club_id: Int
    @Published var clubFull: Club?
    
    init(club_id: Int) {
        self.club_id = club_id
        getClub()
    }
    
    func getClub() {
        APIService.getClub(clubId: club_id) { [weak self] club, message in
            DispatchQueue.main.async {
                self?.clubFull = club
            }
        }
    }
}
