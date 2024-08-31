---
title: SQL queries on JSON files with DuckDB
date: 2024-08-31
---

A long time ago, I was impressed with [harelba/q][q] and how it made it easy to run SQL queries against CSV files. To my surprise, I recently learned that one can do the same with [DuckDB][duckdb], running [SQL queries against JSON][duckdb-json]. There's no need to remember the not-so-intuitive `jq` syntax, just plain old SQL:

```
$ wget -O repos.json https://api.github.com/users/myhro/repos
$ duckdb -c "SELECT language, count(*) FROM 'repos.json' WHERE language IS NOT NULL GROUP BY 1 ORDER BY count_star() DESC"
┌──────────┬──────────────┐
│ language │ count_star() │
│ varchar  │    int64     │
├──────────┼──────────────┤
│ Python   │            8 │
│ Shell    │            5 │
│ C        │            3 │
│ Ruby     │            2 │
│ HTML     │            2 │
│ Makefile │            1 │
│ Go       │            1 │
│ Lua      │            1 │
│ PHP      │            1 │
│ CSS      │            1 │
├──────────┴──────────────┤
│ 10 rows       2 columns │
└─────────────────────────┘
```

[duckdb-json]: https://www.pgrs.net/2024/03/21/duckdb-as-the-new-jq/
[duckdb]: https://duckdb.org/
[q]: https://harelba.github.io/q/
