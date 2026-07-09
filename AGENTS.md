# Repository Guidelines

## 專案結構與模組規劃

目前此 workspace 尚未偵測到完整專案檔案。新增程式時請維持結構清楚，並在必要時更新本文件。建議採用以下慣例：

- `src/`：主要應用程式或資料處理程式碼。
- `tests/`：自動化測試，路徑盡量對應 `src/`。
- `docs/`：需求說明、資料表定義、報告邏輯與操作筆記。
- `assets/` 或 `public/`：圖片、範例資料、靜態資源。
- `scripts/`：可重複執行的自動化腳本。

不要將 build 產物、套件資料夾、暫存檔、帳密或 token 放進版本控制。

## 建置、測試與開發指令

目前尚未設定固定 build system。導入工具後，請在此補上可從 repo root 執行的標準指令。例如：

- `python script.py`：執行單一 Python 腳本。
- `pytest`：執行 Python 測試。
- `npm run dev`：啟動前端或網頁工具開發伺服器。
- `npm run build`：產生正式建置輸出。

若使用其他生態系，優先提供等效且穩定的根目錄指令，例如 `make test`、`go test ./...` 或 `cargo test`。

## 程式風格與命名規則

預設使用繁體中文溝通；程式碼、SQL、錯誤訊息、路徑、表格名稱與欄位名稱保留英文原文。Python 使用 4 spaces 縮排，函式與模組使用 `snake_case`。JavaScript、TypeScript、JSON、YAML、Markdown 使用 2 spaces 縮排。檔名可讀性優先，Markdown 與靜態資源建議使用 `kebab-case`。

撰寫 Trino SQL 時，優先使用清楚的 CTE、具描述性的 alias，並避免在未確認欄位定義前硬寫商業邏輯。

## 測試準則

新增功能、修 bug 或調整資料處理邏輯時，盡量補上測試或提供可重現的驗證步驟。測試檔命名需描述行為，例如 `test_yield_summary.py` 或 `process-window.test.ts`。測試應可重複執行，避免依賴個人電腦狀態或外部網路；若必須連接內部資料源，請明確標示為 integration test。

## Commit 與 Pull Request 準則

目前此 workspace 沒有 Git history，因此尚未偵測到既有 commit 慣例。建議 commit message 使用簡短祈使句，例如 `Add Trino query template` 或 `Fix highlight report export`。PR 應包含修改摘要、測試方式、相關 issue 或需求來源；若有 UI、Power BI、報表或視覺化變更，請附截圖或輸出範例。

## 使用者工作背景

主要使用者是華邦電子薄膜製程工程師，目前工作重點為數位專案開發，包含機器學習、工作效率提升、自動化操作、簡易爬蟲與網頁控制。常用工具與語言包含 `Python`、`Trino SQL`、`Power BI`、`Copilot Studio`。

Codex 協作重點：

- 在使用者提供公司 Trino 連線設定、資料庫結構、table 意義與查詢慣例後，協助快速撰寫與調整 SQL。
- 根據使用者提供的資料、圖表、製程觀察或重點筆記，協助產出 highlight 報告初稿。
- 協助撰寫機器學習相關 Python code，包含資料清理、特徵工程、模型訓練、評估與結果解釋。

## Agent 專用指示

修改檔案前先檢查目前 workspace 狀態，避免覆蓋使用者既有內容。優先做小範圍、可驗證的修改。不要把帳號、密碼、token、憑證或敏感內部資料庫細節寫入本檔；這類資訊只應存在使用者明確指定的本機安全檔案或當次任務上下文。
