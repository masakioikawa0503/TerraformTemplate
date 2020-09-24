# mainの定義
# profile: 事前にaws-cliでcredentialsに登録している
# region: 東京リージョン
provider "aws" {
    profile = "oikawa"
    region = "ap-northeast-1"
}