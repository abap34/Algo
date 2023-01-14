package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
)



func main()  {
	var N int
	var robots = make(map[int]int, N)
	r := bufio.NewReader(os.Stdin)
	w := bufio.NewWriter(os.Stdout)
	defer w.Flush()
	fmt.Fscan(r, &N)
	i := 0
	for  N > i  {
		var a,b int
		fmt.Fscan(r,&a,&b)
		robots[a] =
	}
	slice1 := make([]int,len(robots))
	index := 0
	for key:=range robots{
		slice1[index] = key
		index ++
	}
	sort.Ints(slice1)
	robotss := make(map[int]int,N)
	for _,key := range slice1 {
		robots[key] = robots[key]
	}
	old_robot := - (10^10)
	rem := 0
	for robot1,robot2:=range robotss  {
		lefts  := robot1 - (robot2 - robot1)
		if  old_robot > lefts{
			fmt.Println(robot1,"はかぶりです。\n左端が",lefts,"前の右が",old_robot,"なので")
			rem ++
			old_robot = - (10 ^ 10)
		} else {
			fmt.Println("OK")
			old_robot = robot1 + robot2 - 1
		}
	}
	var anser int
	anser = N - rem
	fmt.Println(anser)
}
