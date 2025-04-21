USE python_study;

-- 返回当前日期
SELECT CURRENT_DATE();

-- 计算两个日期之间的差天数
SELECT DATEDIFF('2025-04-21', '2025-04-20');

-- 计算两个日期之间的差年数
SELECT TIMESTAMPDIFF(YEAR, '2024-04-21', '2025-04-21');
