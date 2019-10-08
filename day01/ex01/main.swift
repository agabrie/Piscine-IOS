let card1 = Card(c : Color.Spade, v : Value.Ace);

card1: Card = {
    ObjectiveC.NSObject = {
        isa = __lldb_expr_9.Card
    }
    color = Spade
    value = Ace
};

print(card1)

let card2 = Card(c : Color.Diamond, v: Value.Two)

card2: Card = {
    ObjectiveC.NSObject = {
        isa = __lldb_expr_9.Card
    }
    color = Diamond
    value = Two
}

print(card2)
print(card1 == card2)