# vimの操作

vimの操作に関するメモ  
参考
<https://qiita.com/colorrabbit/items/755cfbb0e97d48280775>
<https://qiita.com/iwaseasahi/items/f536bb3772d2fad5e03c>
<https://qiita.com/nesheep5/items/d072d960639eef87c3e0>


## 移動

<details>
  <summary>詳細</summary>

|操作|コマンド|
|:-|:-|
|*h,j,k,l*|←,↓,↑,→|
|*w*|1単語分前へ移動|
|*b*|1単語分後ろへ移動|
|*gg*|ファイル先頭に戻る|
|*Shift + g*|ファイル末尾に進む|
|*0*|行頭へ|
|*$*|行末へ|
|*^*|行の最初の空白でない文字へ|
|*5l*|5文字分右へ|
|*CTRL+f*|ページアップ|
|*CTRL+b*|ページダウン|
|*Shift+m*|カーソルを画面の中心へ|
|*f*|fを押して文字を打ち込むと、カーソル行にあるその文字のところに進む。文字入力後、; を押すと戻る|
|*%*|(, ), {, }, [, ] カッコ移動などの対応する場所へ移動|
|*mk*|現在のカーソル位置をマーク|
|*'k*|マークした位置へ|
|*d'k*|現在位置からマークまでを削除|


</details>

## 編集(削除・コピー・挿入)

<details>
  <summary>詳細</summary>
  
### 削除
<details>
  <summary>詳細</summary>

|操作|コマンド|
|:-|:-|
|*x*|1文字削除|
|*dd(連打)*|1行切り取り|
|*dd(x行目で１回目のdを押し、y行目で2回目のdを押す)*|x行目〜y行目までを切り取り|
|*5dd (xdd)*|5(x)行削除|
|*diw*|カーソル上の単語を削除|
|*di"*|ダブルクォーテーションの内部を削除|
|*dit*|HTMLタグの内部を削除|
|*ciw*|カーソル上の単語を削除して、インサートモード|
|*ci"*|ダブルクォーテーションの内部を削除して、インサートモード|
|*cit*|HTMLタグの内部を削除して、インサートモード|
|*D*|カーソル位置から行末まで削除|
|*C*|カーソル位置から行末まで削除して, インサートモード|
</details>

### コピー
<details>
  <summary>詳細</summary>

|操作|コマンド|
|:-|:-|
|*yy(連打)*|1行コピー|
|*yy(x行目で１回目のを押し、y行目で2回目のyを押す)*|x行目からy行目までをコピー|
|*yiw*|カーソル上の単語をコピー|
|*yi"*|ダブルクォーテーションの内部をコピー|
|*yit*|HTMLタグの内部をコピー|
</details>

### 挿入
<details>
  <summary>詳細</summary>

|操作|コマンド|
|:-|:-|
|*p*|貼り付け|
|*o*|現在の行の下に改行し、インサートモード|
|*a*|カーソルの右側にインサートモード|
|*i*|行頭に移動し、インサートモード|
|*A*|行末に移動し、インサートモード|
</details>

### インデント
<details>
  <summary>詳細</summary>

|操作|コマンド|
|:-|:-|
|*=*|選択行のインデント修正|
|*gg, shift+v, shift+g, =*|ファイル全体のインデント修正|
|*ctrl-t, ctrl-d*|挿入モードでインデントを追加/削除|
|*>>*|インデントを追加|
|*<<*|インデントを削除|
|*:set shiftwidth=4*|インデント幅をスペース4つ分にする|
|*:set autoindent*|オートインデントをON|
|*:set smartindent*|スマートなオートインデントをON|
</details>

</details>

## 検索・置換
<details>
  <summary>詳細</summary>
  
  ### 検索
  <details>
    <summary>詳細</summary>

|操作|コマンド|
|:-|:-|
|*/ + 文字*|ページ内の文字を検索|
|*n*|前方の同じ文字を検索|
|*N*|後方の同じ文字を検索|
|*/lover*|文字列hogeを検索（上から下へ）|
|*?lover*|文字列hogeを検索（下から上へ）|
|*検索候補表示中に n*|カーソルより下側にある検索候補に移動|
|*検索候補表示中に shift+n*|カーソルより上側にある検索候補に移動|
|_*_|今単語がある位置の単語を検索（カーソルより下側）|
|*#*|今単語がある位置の単語を検索（カーソルより上側）|
|*/lo[vb]er*|文字列の"lover"か"lober"を検索する|
|*/<love*|文字列"love"から始まる単語を検索|
|*/love>*|文字列"love"で終わる単語を検索|
|*/<love>*|文字列"love"を検索|
|*/^love*|文字列"love"から始まる行を検索|
|*/love$*|文字列"love"で終わる行を検索|
|*/^love$*|文字列"love"だけの行を検索|
|*/<….>*|4文字の単語を検索|
|*/love\*|kill|
|*/<\d\d\d\d>*|4桁の数字を検索|
|*/^n{3}*|空の3行を検索|
|*:bufdo /love/*|現在開いているファイル全部の中から文字列"love"を検索|
  
  </details>
  
  ### 置換
  <details>
    <summary>詳細</summary>

|操作|コマンド|
|:-|:-|
|*:s/before/ater*|カーソルのある行にある最初の文字列"before"を"after"に置換（1つずつ）|
|*:s/before/after/g*|カーソルのある行にある文字列"before"をすべて"after"に一括置換|
|*:s/before/after/gc*|カーソルのある行にある文字列"before"をすべて"after"に置換。確認を表示させる|
|*:%s/before/after/g*|現在使っているファイルにある文字列"before"を"after"に一括置換|
|*:%s/before/after/g*|現在使っているファイルにある文字列"before"を"after"に置換。確認を表示させる|
|*:%s;/var/home;/usr/home;gc*|パス名などを置換するときは、"/"でなく、";"を区切り文字に使用|
|*:63,79s /lover/killer/g*|特定範囲のみ置換： 63〜79行目までの範囲にある"lover"を"killer"に一括置換|
|*:%s/^/Goodbye/g*|ファイル全体のすべての行の先頭に"Goodbye"を追加|
|*:%s/$/./g*|ファイル全体のすべての行の末尾に"."を追加|
|*:3,$s/lover/killer/g*|特定範囲のみ置換： 3行目から最終行の範囲にある"lover"を"killer"に一括置換|
|*:%s/ /^M/g;*|ファイル全体の中からスペース（空文字）を改行(CR)に置換（改行は CTRL+vを押した後にEnterを押すと入力される）|
|*:%s/GoodByeMyLove/ILoveYou/gi*|ファイル全体の中から"GoodByeMyLove"を"ILoveYou"に置換する。"GoodByeMyLove"は大文字小文字関係なく検索する|
|_:%s/ *$/g_|ファイル全体の行末の空文字（空白、スペース）を削除|
|*:%s#<[^>]+>##g*|タグに囲まれたテキストは残しつつ、HTMLタグを全て削除|
|*:g/love/d*|"love"を含んでる行を削除|
|*:v/goodbye*|"goodbye"を含んでいない行だけを削除|
|_:%s/^(.*)n1$/1/_|同じ行が2回続いたら片方削除|
|*CTRL+a*|カーソル上の数字をインクリメント|
|*CTRL+x*|カーソル上の数字をデクリメント|
|_argadd */.c_|カレントディレクトリ以下にある.cファイルを選択|
|*:argdo*|%s/lover/friend/gc \	update|
|*:tabdo*|%s/lover/friend/g	すべてのタブに対して、"lover"を"friend"に置換|
    
  </details>
</details>

## 画面
<details>
  <summary>詳細</summary>
  
  ### 画面分割
  <details>
    <summary>詳細</summary>
  
|操作|コマンド|
|:-|:-|
|*:sp*|上下分割|
|*:vs*|左右分割|
|*CTRL+w CTRL+w(CTRL+wを2回押す)*|次の画面へ|
|*CTRL+w ↑（矢印）*|カーソルを上のウィンドウへ|
|*CTRL+w _*|選択中のウィンドウを最大化|
|*CTRL+w =*|分割したすべてのウィンドウを同じ大きさに|
|*10 CTRL+w +*|選択中のウィンドウを10行大きくする|
|*:close*|画面を閉じる|
|*:hide*|現在のウィンドウを閉じる|
|*:only*|現在のウィンドウ以外を閉じる|
|*:b 2*|バッファの2番目を開く|

  </details>
  
  ### タブ
  <details>
    <summary>詳細</summary>
  
|操作|コマンド|
|:-|:-|
|*:tabnew*|新しいタブ作成|
|*:tabe filename*|filenameをタブで開く|
|*:tabclose*|タブを閉じる|
|*gt*|次のタブへ|
|*g shift+t*|前のタブへ|
|*{i}gt*|i番目のタブへ|
|*:tabdo %s/before/after/g*|すべてのタブに対して、一括置換|
|*:tabs*|開いているタブをリスト表示|
|*:tabo*|今使っているタブ以外を閉じる|
|*:tabfirst*|最初のタブを表示|
|*:tablast*|最後のタブを表示|
|*:tabm n*|現在のタブをn番目へ|
|*:tab ball*|バッファをすべてタブで開く|

  </details>

</details>

## Visualモード
<details>
  <summary>詳細</summary>
  
|操作|コマンド|
|:-|:-|
|*v*|ヴィジュアルモードに入って一文字選択|
|*shift+v*|ヴィジュアルモードに入って一行選択|
|*CTRL+v*|矩形（くけい）選択 （複数行選択）|
|*v, gg, shift+g*|全選択|
|*CTRL + v, I(shift + i), input words or delete, esc*|矩形選択後、選択範囲の編集|
  
</details>

## その他
<details>
  <summary>詳細</summary>

|操作|コマンド|
|:-|:-|
|*u*|undo|
|*CTRL + r*|redo|
|*.*|直前のコマンドを実行|
|*CTRL+n*|補完|
|*qa*|レコーディングを開始|
|*q*|レコーディングを終了|


</details>

