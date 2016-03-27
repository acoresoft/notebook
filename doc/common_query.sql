SELECT
	SUBSTRING_INDEX(res.resUrl, '.shtml', 1)
FROM
	sys_resources res
WHERE
	res.resUrl LIKE '%.shtml';

-- 修改URL 
UPDATE sys_resources res
SET res.resUrl = SUBSTRING_INDEX(res.resUrl, '.shtml', 1)
WHERE
	res.resUrl LIKE '%.shtml';