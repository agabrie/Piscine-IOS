var allColors:[Color] = Color.allColors
var allValues:[Value] = Value.allValues

for c in allColors {
    print("\(c)\t\t=>\(c.rawValue)")
}
print(allColors)

for c in allValues {
    print("\(c)\t\t=>\(c.rawValue)")
}
print(allValues)