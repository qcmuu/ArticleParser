-- :name get_article_snapshots_by_article_id :many
SELECT
  *,
  Article.site_id AS site_id,
  Article.first_snapshot_at AS first_seen_at,
  Article.last_snapshot_at AS last_updated_at
FROM ArticleSnapshot
JOIN Article ON ArticleSnapshot.article_id = Article.article_id
WHERE Article.article_id = :article_id
ORDER BY ArticleSnapshot.snapshot_at ASC
LIMIT :limit
OFFSET :offset
