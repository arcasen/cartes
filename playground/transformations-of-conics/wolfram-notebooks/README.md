Notebook 加载 Utils.m 注意事项

```
Directory[]
```

给出当前的工作目录.
默认 wlnb 启动的 wolfscript 解释器的工作目录是 `\`

此时如果使用 `<< Utils.m` 就会出现加载失败

```
Get::noopen: Cannot open Utils.m.
```

应该先设置工作路径 然后加载

```
SetDirectory["~/Repos/euclidea/linear-algebra/wolfram-notebooks"]
<< Utils.m
```

或者

```
AppendTo[$Path, "~/Repos/euclidea/linear-algebra/wolfram-notebooks"];
<< Utils.m
```
