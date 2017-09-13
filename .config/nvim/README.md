# nvim_setting

neovimのメモ
  
  

## mapとnoremap

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

---

### noremapの例
`:map <C-a> <C-x>`  
`:noremap t <C-a>`  
↓
`10 → 11`

![alt text](https://raw.githubusercontent.com/Snhgo/img/master/nvim/noremap_ta.png)

---
  
  
  

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
