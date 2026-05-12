package clock

import "fmt"

type Clock struct {
	hours   int
	minutes int
}

func New(h, m int) Clock {
	h = (h + (m / 60)) % 24
	m = m % 60

	if m < 0 {
		m += 60
		h--
	}

	if h < 0 {
		h += 24
	}

	return Clock{
		hours:   h,
		minutes: m,
	}
}

func (c Clock) Add(m int) Clock {
	return New(c.hours, c.minutes+m)
}

func (c Clock) Subtract(m int) Clock {
	return New(c.hours, c.minutes-m)
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c.hours, c.minutes)
}
