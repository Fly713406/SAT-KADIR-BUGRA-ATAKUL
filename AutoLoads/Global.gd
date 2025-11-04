extends Node

var playerData = {
	"skor" :0
}

# setget örnek kullanımı
var setGetKullanimi = false setget setGetKullanimiSet, setGetKullanimiGet
	
func setGetKullanimiSet(value):
	setGetKullanimi = value
	
func setGetKullanimiGet():
	return setGetKullanimi
