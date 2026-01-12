package utils

import (
	"github.com/gin-gonic/gin"
)

type UserInfo struct {
	UserId   int64  `json:"userId"`
	UserName string `json:"userName"`
}

func GeuUserInfo(ctx *gin.Context) *UserInfo {
	//TODO 暂时返回测试值
	return &UserInfo{
		UserId:   1,
		UserName: "魔丸",
	}
	userIdVal, ok := ctx.Get("userId")
	if !ok {
		return nil
	}

	userNameVal, ok := ctx.Get("userName")
	if !ok {
		return nil
	}

	userId, ok := userIdVal.(int64)
	if !ok {
		return nil
	}

	userName, ok := userNameVal.(string)
	if !ok {
		return nil
	}

	return &UserInfo{
		UserId:   userId,
		UserName: userName,
	}
}
