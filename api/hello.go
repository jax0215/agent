package api

import (
	"agent/model/common/response"
	"agent/utils"

	"github.com/gin-gonic/gin"
)

type Hello struct{}

func (h *Hello) Hello(ctx *gin.Context) {
	userInfo := utils.GeuUserInfo(ctx)
	response.OkWithData(userInfo, ctx)
}
