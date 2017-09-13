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

***

### noremapの例
`:map <C-a> <C-x>`  
`:noremap t <C-a>`  
↓
`10 → 11`

![alt text](https://raw.githubusercontent.com/Snhgo/img/master/nvim/noremap_ta.png)

***


## fugitive
gitラッパープラグイン
