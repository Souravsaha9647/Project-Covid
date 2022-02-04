Select *
From project.coviddeaths;

SELECT location, date, total_cases, new_cases, total_cases, population
FROM project.coviddeaths
ORDER BY 1,2;

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Efectedpopulation
FROM project.coviddeaths
WHERE location like '%india%'
ORDER BY Efectedpopulation;

SELECT location, date, MAX(CAST(new_cases as int)) as highestInfection, MAX(total_cases/population)*100 as Efectedpopulation
FROM project.coviddeaths
GROUP BY location, population
ORDER BY Efectedpopulation DESC;

SELECT date, SUM(new_cases), SUM(new_deaths) as Death
FROM project.coviddeaths
WHERE continent is not null
GROUP BY location, population
ORDER BY Death DESC;

SELECT 
CAST(total_deaths AS INT)
FROM project.coviddeaths;

Select SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths, SUM(new_deaths)/SUM(New_Cases)*100 as DeathPercentage
FROM project.coviddeaths
where continent is not null 
order by 1,2;

Select continent, MAX(Total_deaths) as TotalDeathCount
FROM project.coviddeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc

  
  
  
  
  
  