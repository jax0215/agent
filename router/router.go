package router

import (
	"agent/api"
	"net/http"

	"github.com/gin-gonic/gin"
)

// InitRouter 初始化路由和中间件
func InitRouter(r *gin.Engine) *gin.Engine {
	hello := api.Hello{}
	// 健康检查
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"message": "pong"})
	})

	// 分组路由
	api := r.Group("/api/v1")
	{
		api.GET("/hello", hello.Hello)
	}
	return r
}
