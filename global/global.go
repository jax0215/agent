package global

import (
	"agent/config"
	"sync"

	"github.com/spf13/viper"
	"go.uber.org/zap"
	"gorm.io/gorm"
)

var (
	CONFIG config.Server
	VP     *viper.Viper
	LOG    *zap.Logger
	DB     *gorm.DB
	DBMap  map[string]*gorm.DB
	lock   sync.RWMutex
)

// MustGetGlobalDBByDBName 通过名称获取db 如果不存在则panic
func MustGetGlobalDBByDBName(dbname string) *gorm.DB {
	lock.RLock()
	defer lock.RUnlock()
	db, ok := DBMap[dbname]
	if !ok || db == nil {
		panic("db no init")
	}
	return db
}
