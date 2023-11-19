//
//  Extension+Date.swift
//  tNews
//
//  Created by Muhammad M. Munir on 16/11/23.
//

import Foundation

extension String {
    func getDateTimeLapse(dateFormatter: DateFormatter = DateFormatter()) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = dateFormatter.date(from: self) {
            let today = Date()
            let calendar = Calendar.current
            let date1 = calendar.startOfDay(for: today)
            let date2 = calendar.startOfDay(for: date)

            let newsYear = calendar.component(.year, from: date)
            let thisYear = calendar.component(.year, from: today)

            if newsYear != thisYear {
                dateFormatter.dateFormat = "dd MMM yyyy"
                return dateFormatter.string(from: date)
            } else {
                let dayComponents = calendar.dateComponents([.day], from: date2, to: date1)
                if let day = dayComponents.day {
                    if day < 7 {
                        let hourComponents = calendar.dateComponents([.hour], from: date, to: today)
                        if let hour = hourComponents.hour {
                            if hour == 0 {
                                let minuteComponents = calendar.dateComponents([.minute], from: date, to: today)
                                if let minute = minuteComponents.minute {
                                    return "\(minute) menit yang lalu"
                                }
                            } else if hour < 24 {
                                let minuteComponents = calendar.dateComponents([.minute], from: date, to: today)
                                if let minute = minuteComponents.minute {
                                    if (minute % 60) > 29 {
                                        if hour+1 == 24 {
                                            return "Kemarin"
                                        } else {
                                            return "\(hour + 1) jam yang lalu"
                                        }
                                    } else {
                                        return "\(hour) jam yang lalu"
                                    }
                                }
                            } else if hour >= 24 && hour < 48 {
                                return "Kemarin"
                            } else {
                                return "\(day) hari lalu"
                            }
                        }
                    } else {
                        dateFormatter.dateFormat = "dd MMM yyyy"
                        return dateFormatter.string(from: date)
                    }
                }
            }
        }
        
        return self
    }
    
    func getDateArticle(
        dateFormatter: DateFormatter = DateFormatter()
    ) -> String {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard let date = dateFormatter.date(from: self) else {
            return self
        }
        
        dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
        return dateFormatter.string(from: date)
    }
}
