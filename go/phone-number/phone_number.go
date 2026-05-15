package phonenumber

import (
	"errors"
	"fmt"
	"strings"
)

func Number(phoneNumber string) (string, error) {
	var counter int
	var phone strings.Builder

	for i := 0; i < len(phoneNumber); i++ {
		digit := phoneNumber[i]

		if digit >= '0' && digit <= '9' {
			// format: NXX NXX-XXXX
			// where `N` is any digit from 2 through 9...
			if (counter == 0 || counter == 3) && digit < '2' {
				continue
			}

			phone.WriteByte(digit)
			counter++
		}

		if counter > 10 {
			return "", errors.New("more than 10 digits")
		}
	}

	if counter < 10 {
		return "", errors.New("less than 10 digits")
	}

	return phone.String(), nil
}

func AreaCode(phoneNumber string) (string, error) {
	phone, err := Number(phoneNumber)
	if err != nil {
		return "", err
	}

	return phone[:3], nil
}

func Format(phoneNumber string) (string, error) {
	phone, err := Number(phoneNumber)
	if err != nil {
		return "", err
	}

	return fmt.Sprintf("(%s) %s-%s", phone[:3], phone[3:6], phone[6:]), nil
}
