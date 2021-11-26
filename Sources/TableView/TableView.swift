
import SwiftUI

public struct TVTableView: View {
    
    let fields: [TVField]
    let rows: [Data] = ["Tablets", "Tablet"].map { $0.data(using: .utf8)! }
    var columns: [GridItem] {
        var columns = [GridItem]()
        for field in fields {
            columns.append(GridItem(.fixed(CGFloat(field.configuration.size))))
        }
        return columns
    }
    
    public var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(fields) { field in
                field.tableTitleLabel
            }
            ForEach(rows, id: \.self) { row in
                var index = rows.firstIndex(of: row)
                
                fields[index ?? 0].makeCell(with: row)
            }
        }
    }

    public init(rows fields: [TVField] = [textField, pickerField]) {
        self.fields = fields
    }
}
