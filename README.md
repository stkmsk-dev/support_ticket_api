Support Ticket API
サポートチケット（問い合わせ）を管理するための REST API です。
チケットの作成・取得・更新・削除などの基本操作を提供します。

📌 概要
このAPIは、カスタマーサポートや問い合わせ管理システムのバックエンドとして利用することを目的としています。
ユーザーからの問い合わせを「チケット」として管理し、対応状況の追跡や優先度管理が可能です。

📡 API エンドポイント
▶ Tickets
一覧取得
GET /api/v1/tickets
作成
POST /api/v1/tickets
詳細取得
GET /api/v1/tickets/:id
更新
PUT /api/v1/tickets/:id
削除
DELETE /api/v1/tickets/:id
▶ Comments（チケットに紐づく）
一覧取得
GET /api/v1/tickets/:ticket_id/comments
作成
POST /api/v1/tickets/:ticket_id/comments
🗂 データ構造（例）
Ticket
{
  "id": 1,
  "title": "ログインできない",
  "description": "エラーが出る",
  "status": "open",
  "created_at": "2026-01-01T00:00:00Z"
}
Comment
{
  "id": 1,
  "ticket_id": 12,
  "user_id": 3,
  "content": "現在調査中です。少々お待ちください。",
  "created_at": "2026-04-10T10:00:00Z",
  "updated_at": "2026-04-10T10:00:00Z"
}