import Foundation
class Card:NSObject{
    var color:Color
    var value:Value
    init(c color:Color,v value:Value)
    {
        self.color = color
        self.value = value
        super.init();
    }
}
extension Card {    
    override var description:String {
        return "\(value) of \(color.rawValue)s"
    }
    override func isEqual(_ other: Any?) -> Bool {
        if let other = other as! Card? {
            return (self.color == other.color && self.value == other.value)
        }
        return (false)
    }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return(lhs.isEqual(rhs))
    }
}