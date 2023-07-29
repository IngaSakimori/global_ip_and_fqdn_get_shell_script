　　　ヘヘヘ    
　＜（・∀・）＞  
　　　ＶＶＶ  
Piyo-Piyo Fortress  

# global_ip_and_fqdn_get_shell_script
シェルスクリプトでipinfo.ioからグローバルIPとFQDNをとってきてファイルに書き込むスクリプトです

実行するとこんな感じで出力されます

・RESULT_TXT.log

20230729144509☆日時	106.XXX.XXX.XXX☆グローバルIP	mXXXX.IPXX.XX☆FQDN	Hachioji☆都市名	JP☆国名

cronで実行することでIPアドレスや国の判定を統計データとして取得可能です

各値はタブ区切りで取得されますのでexcel等で加工できます

利用する際はipinfo.ioでアカウントを作成し、APIトークンキーを取得してください

また利用するシステムで「jq」をインストールしてください
