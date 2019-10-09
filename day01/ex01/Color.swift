enum Color:String{
	case Heart		= "Heart"
	case Spade		= "Spade"
	case Club		= "Club"
	case Diamond	= "Diamond"
}
extension Color {
	static let allColors:[Color] = [
		.Heart	,
		.Spade	,
		.Club	,
		.Diamond
	]
}

