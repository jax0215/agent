package initialize

import (
	"agent/global"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func Gorm() *gorm.DB {
	db, err := gorm.Open(mysql.Open(global.CONFIG.Mysql), &gorm.Config{})
	if err != nil {
		panic("数据库连接失败: " + err.Error())
	}
	return db
}
