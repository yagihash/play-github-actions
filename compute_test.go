package compute

import "testing"

func TestAdd(t *testing.T) {
	cases := []struct {
		name   string
		inputA int
		inputB int
		want   int
	}{
		{name: "PositiveAndPositive", inputA: 1, inputB: 2, want: 3},
	}

	for _, c := range cases {
		t.Run(c.name, func(t *testing.T) {
			got := Add(c.inputA, c.inputB)
			if got != c.want {
				t.Errorf("\ngot:  %v\nwant: %v", got, c.want)
			}
		})
	}
}
