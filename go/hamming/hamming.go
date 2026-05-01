package hamming

import "fmt"

func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, fmt.Errorf("strands must have the same length (given %q and %q)", a, b)
	}

	var distance int
	for i, char := range a {
		if char != rune(b[i]) {
			distance++
		}
	}

	return distance, nil
}
