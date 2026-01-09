package global

import (
	"agent/config"

	"github.com/spf13/viper"
	"go.uber.org/zap"
	"gorm.io/gorm"
)

var (
	CONFIG config.Server
	VP     *viper.Viper
	LOG    *zap.Logger
	DB     *gorm.DB
)
