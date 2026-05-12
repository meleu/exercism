package isbnverifier

func IsValidISBN(isbn string) bool {
	var n, sum, counter int

	for i := 0; i < len(isbn); i++ {
		if counter > 10 {
			return false
		}
		ch := isbn[i]

		switch {
		case ch == '-':
			continue

		case ch == 'X':
			if counter != 9 {
				return false
			}
			n = 10

		case ch >= '0' && ch <= '9':
			n = int(ch - '0')

		default:
			return false
		}

		sum += n * (10 - counter)
		counter++
	}

	return counter == 10 && sum%11 == 0
}
