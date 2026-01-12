package main

import (
	"agent/core"
	"agent/global"
	"agent/initialize"
	"agent/router"
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	//	初始化系统
	initializeSystem()
	//	启动服务
	Run()
}

// 初始化系统
func initializeSystem() {
	global.VP = core.Viper()      // 初始化Viper
	global.LOG = core.Zap()       // 初始化zap日志库
	global.DB = initialize.Gorm() // gorm连接数据库
	initialize.DBList()
}

func Run() {
	r := gin.New()
	router.InitRouter(r)
	fmt.Println("http启动...端口：", global.CONFIG.HttpPort)
	err := r.Run(":" + global.CONFIG.HttpPort)
	if err != nil {
		panic(err)
	}
}
