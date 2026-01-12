package config

type DsnProvider interface {
	Dsn() string
}

type SpecializedDB struct {
	Disable   bool   `mapstructure:"disable" json:"disable" yaml:"disable"`
	AliasName string `mapstructure:"alias-name" json:"alias-name" yaml:"alias-name"`
	DB        string `mapstructure:"db" json:"db" yaml:"db"`
}
