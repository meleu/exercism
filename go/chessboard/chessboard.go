package chessboard

// File stores if a square is occupied by a piece
type File []bool

// Chessboard contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string]File

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) (counter int) {
	for _, occupied := range cb[file] {
		if occupied {
			counter++
		}
	}
	return
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) (counter int) {
	index := rank - 1
	for _, file := range cb {
		if index < 0 || index > len(file) {
			return 0
		}
		if file[index] {
			counter++
		}
	}
	return
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) (counter int) {
	for _, file := range cb {
		for range file {
			counter++
		}
	}
	return
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) (counter int) {
	for _, file := range cb {
		for _, occupied := range file {
			if occupied {
				counter++
			}
		}
	}
	return
}
