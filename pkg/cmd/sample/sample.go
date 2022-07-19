package sample

import (
	"fmt"

	"github.com/spf13/cobra"
)

type SampleOptions struct{}

func NewSampleCommand(o SampleOptions) *cobra.Command {
	cmd := &cobra.Command{
		Use:   "sample",
		Short: "sample usage",
		Run: func(cmd *cobra.Command, args []string) {
			err := o.Complete()
			if err != nil {
				fmt.Println(err)
				return
			}
			err = o.Run()
			if err != nil {
				fmt.Println(err)
				return
			}
		},
	}
	return cmd
}

func (o *SampleOptions) Complete() error {
	return nil
}

func (o *SampleOptions) Run() error {
	fmt.Println("Please fill Run()")
	return nil
}
