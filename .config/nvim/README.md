# nvim_setting

neovimのメモ
  
  

## mapとnoremap
<details>
  <summary>mapとnoremapの違いメモ</summary>

参考
<http://cocopotn.me/blog/?p=3871>


### mapの例
`:map <C-a> <C-x>`  
↓  
`10 → 9`

![alt text](https://raw.githubusercontent.com/Snhgo/img/master/nvim/map_ax.png)


`:map t <C-a>`  
`:map <C-a> <C-x>`  
↓  
`10 → 9`

![alt text](https://raw.githubusercontent.com/Snhgo/img/master/nvim/map_tax.png)


### noremapの例
`:map <C-a> <C-x>`  
`:noremap t <C-a>`  
↓
`10 → 11`

![alt text](https://raw.githubusercontent.com/Snhgo/img/master/nvim/noremap_ta.png)

</details>
  
  

## fugitive
<details>
  <summary>gitラッパープラグイン</summary>
  
参考
<http://blog.yuku-t.com/entry/20110427/1303868482>

#### ：Gstatus
新しい窓を作ってgit statusを表示

#### ：Gwrite
現在開いているソースをgit add
#### ：Gread
現在開いているソースの直前のコミット時のソースを表示
#### ：Gmove destination/path
現在開いているソースをgit mvする
#### ：Gremove
現在開いているソースをgit rmする
#### ：Gcommit
git commit
#### ：Gblame
現在のソースをgit blame。vimが色づけしてくれる
#### ：Gdiff
現在のソースの変更点をvimdiffで表示
</details>

## NERDTree
<details>
  <summary>使い方メモ</summary>
  
参考
<https://altarf.net/computer/mac%E3%81%A7%E3%81%AE%E3%82%A8%E3%83%B3%E3%82%B8%E3%83%8B%E3%82%A2%E3%83%AA%E3%83%B3%E3%82%B0%E7%9A%84%E3%81%AA%E4%BD%95%E3%81%8B/2829>

### Treeの中を操作する

*タブで開く* t

|操作|コマンド|
|:-:||:-:|
|*タブで開く*|t|

</details>
