package api

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type Hello struct{}

func (h *Hello) Hello(ctx *gin.Context) {
	ctx.JSON(http.StatusOK, gin.H{"message": "Hello Gin!"})
}
