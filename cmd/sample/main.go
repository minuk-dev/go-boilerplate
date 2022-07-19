package main

import (
	"fmt"

	"github.com/minuk-dev/go-boilerplate/pkg/cmd/sample"
)

func main() {
	cmd := sample.NewSampleCommand(sample.SampleOptions{})
	err := cmd.Execute()
	if err != nil {
		fmt.Println(err)
	}
}
