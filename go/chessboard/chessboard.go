package chessboard

// File stores if a square is occupied by a piece
type File []bool

// Chessboard contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string]File

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) int {
	counter := 0
	for _, occupied := range cb[file] {
		if occupied {
			counter++
		}
	}
	return counter
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) int {
	counter := 0
	index := rank - 1
	for _, file := range cb {
		if index < 0 || index > len(file) {
			return 0
		}
		if file[index] {
			counter++
		}
	}
	return counter
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
	counter := 0
	for _, file := range cb {
		for range file {
			counter++
		}
	}
	return counter
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
	counter := 0
	for _, file := range cb {
		for _, occupied := range file {
			if occupied {
				counter++
			}
		}
	}
	return counter
}
