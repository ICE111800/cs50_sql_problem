# CS50 SQL Solutions

Harvard CS50 SQL 課程之 Labs 與 Problem Sets 解題紀錄。

## 結構與內容
| 單元 / 專案 | 核心概念 | 說明 |
| :--- | :--- | :--- |
| `movies/` | SELECT, WHERE, JOIN, Aggregate Functions | 電影資料庫關聯與統計查詢 |
| `fiftyville/` | Complex Multi-table Queries, Subqueries | 刑案線索關聯與推理查詢 |
| `favorites/` | LIKE, GROUP BY, Cleaning Data | 字串模糊比對與清理 |
| `players/` | Basic SELECT, Sorting | 棒球球員資料篩選 |

## 環境需求
* SQLite3
* 執行方式（以 CLI 為例）：
  ```bash
  sqlite3 database.db < solution.sql
  # 或進入互動模式
  sqlite3 database.db
  .read solution.sql
