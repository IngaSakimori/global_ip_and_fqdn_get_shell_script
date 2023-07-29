#!/bin/bash

#####################
#  Inga-Do Type IoT #
#####################

######################
#　　　ヘヘヘ　　　　#
#　＜（・∀・）＞　　#
#　　　ＶＶＶ　　　　#
# Piyo-Piyo Fortress #
######################

#このシェルスクリプトはipinfo.ioを使用し、日時・グローバルIP・FQDN・都市・国の情報を1行にまとめてテキストに書き出すスクリプトです
#cronで実行することでIPアドレスや国の判定を統計データとして取得可能です
#各値はタブ区切りで取得されますのでexcel等で加工できます
#利用する際はipinfo.ioでアカウントを作成し、APIトークンキーを取得してください
#また利用するシステムで「jq」をインストールしてください

API_KEY="YOUR_ipinfo.io_APIKEY"
tabbed_text="\t"
filename="RESULT_TXT.log"

# 日時を取得する関数
get_current_date() {
    current_date=$(date +"%Y%m%d%H%M%S")
    echo "$current_date"
}

# グローバルIPアドレスを取得する関数
get_global_ip_address() {
    global_ip_address=$(curl -s "https://ipinfo.io?token=$API_KEY" | jq -r '.ip')
    echo "$global_ip_address"
}

# FQDNを取得する関数
get_fqdn() {
    fqdn=$(curl -s "https://ipinfo.io?token=$API_KEY" | jq -r '.hostname')
    echo "$fqdn"
}

# countryを取得する関数
get_country() {
    country=$(curl -s "https://ipinfo.io?token=$API_KEY" | jq -r '.country')
    echo "$country"
}

# cityを取得する関数
get_city() {
    city=$(curl -s "https://ipinfo.io?token=$API_KEY" | jq -r '.city')
    echo "$city"
}

# メイン処理
main() {
echo -e "$(get_current_date)$tabbed_text$(get_global_ip_address)$tabbed_text$(get_fqdn)$tabbed_text$(get_city)$tabbed_text$(get_country)"
echo -e "$(get_current_date)$tabbed_text$(get_global_ip_address)$tabbed_text$(get_fqdn)$tabbed_text$(get_city)$tabbed_text$(get_country)" >> $filename
}

# メイン処理を実行
main
