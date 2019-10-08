import Foundation
class Card:NSObject{
    var color:Color
    var value:Value
    init(Cololr color:Color,Value value:Value)
    {
        self.color = color
        self.value = value
        super.init();
    }
    override var description:String {return "Card : \(color.rawValue) : \(value.rawValue)"}
    override func isEqual(_ object: Any?) -> Bool {
        if let object = object as? Card {
            return (self.color == object.color && self.value == object.value)
        }
        return (false)
    }
}
func ==(lhs: Card, rhs: Card) -> Bool {
    return (lhs.color == rhs.color && lhs.value == rhs.value)
}