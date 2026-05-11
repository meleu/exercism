// This version is highly influenced by ozan's solution:
// https://exercism.org/tracks/go/exercises/luhn/solutions/ozan
package luhn

func Valid(id string) bool {
	var count, sum int

	// iterate over the bytes from end to start
	for i := len(id) - 1; i >= 0; i-- {
		ch := id[i]

		switch {
		case ch == ' ': // spaces are ignored
			continue

		case ch >= '0' && ch <= '9': // allowed digits
			n := int(ch - '0') // convert byte to int
			if count%2 != 0 {
				n *= 2
				if n > 9 {
					n -= 9
				}
			}
			sum += n
			count++

		default: // non-digits (and non-spaces) are disallowed
			return false
		}
	}

	return count > 1 && sum%10 == 0
}
