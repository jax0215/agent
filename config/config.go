package config

type Server struct {
	HttpPort string          `mapstructure:"http-port" json:"http-port" yaml:"http-port"`
	JWT      JWT             `mapstructure:"jwt" json:"jwt" yaml:"jwt"`
	Zap      Zap             `mapstructure:"zap" json:"zap" yaml:"zap"`
	Redis    Redis           `mapstructure:"redis" json:"redis" yaml:"redis"`
	DBList   []SpecializedDB `mapstructure:"db-list" json:"db-list" yaml:"db-list"`
	Mysql    string          `mapstructure:"mysql" json:"mysql" yaml:"mysql"`
}
