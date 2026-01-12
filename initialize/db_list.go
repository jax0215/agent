package initialize

import (
	"agent/global"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

const sys = "system"

func DBList() {
	dbMap := make(map[string]*gorm.DB)
	for _, info := range global.CONFIG.DBList {
		if info.Disable {
			continue
		}
		db, err := gorm.Open(mysql.Open(info.DB), &gorm.Config{})
		if err != nil {
			panic("数据库连接失败: " + err.Error())
		}
		dbMap[info.AliasName] = db
	}

	global.DBMap = dbMap
}
