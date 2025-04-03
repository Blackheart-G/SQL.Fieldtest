-- Exploratory Data Analysis

select *
from layoffs_staging;


select Max(total_laid_off), Max(percentage_laid_off)
from layoffs_staging2
where percentage_laid_off = 1
;

select *
from layoffs_staging
where percentage_laid_off = 1 
order by funds_raised_millions DESC;


select company, SUM(total_laid_off), date
from layoffs_staging
group by company
order by 2 DESC;

select min(`date`), max(`date`)
from layoffs_staging;

select country, SUM(total_laid_off)
from layoffs_staging
group by country
order by 2 DESC;

select *
from layoffs_staging;

select YEAR(`date`), SUM(total_laid_off)
from layoffs_staging2
group by YEAR(`date`)
order by 1 desc;

select stage, SUM(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

select company, SUM(percentage_laid_off)
from layoffs_staging2
group by company
order by 2 DESC;

select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month` 
order by 1 asc;

with Rolling_total as
(
select substring(`date`,1,7) as `month`, sum(total_laid_off) as Total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by `month` 
order by 1 asc
)
select `month`, total_off
,sum(total_off) over(order by  `month`) as rolling_total
from rolling_total;

select company, SUM(total_laid_off)
from layoffs_staging2
group by company
order by 2 DESC;

-- # bad use of cte, needs to be inncorrect because you can't use aggregate functions like SUM() in a WHERE clause. Instead, reference the aliased column from the CTE.

select company, year(`date`), SUM(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by company asc;

with company_year (company, year, total_laid_off) as
(
select company, year(`date`), SUM(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
)
select *, DENSE_RANK() over (partition by years order by total_laid_off DESC)
from company_year;
----------------------------------------------------------------# better fixed version below starting line 91



WITH company_year (company, years, total_laid_off)AS (
    SELECT company, YEAR(`date`) AS year, SUM(total_laid_off) AS total_laid_off
    FROM layoffs_staging2
    GROUP BY company, YEAR(`date`)
)
SELECT * 
FROM company_year
WHERE total_laid_off IS NOT NULL
ORDER BY company ASC;







------- # RANKING ++ PULLING NULL OUT ++

with company_year (company, yearS, total_laid_off) as
(
select company, year(`date`), SUM(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), COMPANY_YEAR_RANK AS
(select *,
 DENSE_RANK() over (partition by years order by total_laid_off DESC) AS RANKING
from company_year
WHERE YEARS IS NOT NULL
)
SELECT *
FROM COMPANY_YEAR_RANK
WHERE RANKING <= 5
;















