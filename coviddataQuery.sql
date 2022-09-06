select *
from covidVaccinations$
--where continent is not null
order by 3,4

select *
from covidDeaths$
--where continent is not null
order by 3,4

--selecting the data we are going to be using
SELECT location,date,total_cases,new_cases,total_deaths,population
from covidDeaths$
order by 1,2

--total cases vs total deaths
--likelihood of dying if you contract COVID in INDIA by date.
SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 AS DeathPercentage
from covidDeaths$
Where location like '%india%'
order by 1,2

--Total cases vs population
Select location,date,total_cases,population,(total_cases/population)*100 as infectionPercentage
from covidDeaths$
where location like'india'
order  by 1,2

--now we will look at the percentage of population infected by Location and locate the country 
--with highest percentage of population infected
Select location,MAX(total_cases) as TotalCases,population,MAX((total_cases/population))*100 as currentinfectionPercentage
from covidDeaths$
where continent is not null
group by location,population
order  by 4 desc

--looking at the percentage of deaths by country 
--locate the country with highest percentage of population deceased.

Select location,MAX(cast(total_deaths as int)) as TotalDeaths,population,MAX((cast(total_deaths as int))/population)*100 as currentDeathPercentage
from covidDeaths$
where continent is not null
group by location,population
order  by 4 desc

-- looking at highest number of deaths by country 
-- in some places in our table the location is not entered instead the continent is filled in the place of location ,think of it as instead of a breakdown by country
--the numbers are updated for the entire continent.
--We omit the records where the continent is null and carry the analysis for country/location wise
--We use the MAX function as our columns total_cases and total_deaths are cumulative in nature which means the total number of deaths will be  the number that is recorded on the day data was extracted i.e. the current date

Select location,MAX(cast(total_deaths as int)) as TotalDeaths,population
from covidDeaths$
where continent is not null
group by location,population
order  by 2 desc

--Continent wise breakdown of total deaths

Select location,MAX(cast(total_deaths as int)) as TotalDeathCount,population
from covidDeaths$
where continent is null and location in ('Asia','Africa','Oceania','North America','South America','Europe','World')
group by location,population
order  by 2 desc

--select distinct(continent)
--from covidDeaths$

--select distinct(location)
--from covidDeaths$
--where location in('Asia','Africa','Oceania','North America','South America','Europe')

--GLOBAL NUMBERS
--1)  number of cases and deaths by date.
Select date,sum(new_cases) as TotalNewCases,sum(cast(new_deaths as int)) as TotalDeaths, sum(cast(new_deaths as int))/sum(new_cases) *100 as DeathPercentagebyCases
FROM covidDeaths$
where continent is not null
group by date
order by 1

--looking at total population vs vaccinations

select dea.continent,dea.location,dea.date,vac.new_vaccinations,dea.population
from covidDeaths$ as dea
join covidVaccinations$ as vac
on dea.date=vac.date
and dea.location=vac.location
where dea.continent is not NULL
order by 2,3

--total vaccinations by location 

select dea.location,SUM(cast(vac.new_vaccinations as bigint)) as totalVaccinations,dea.population
from covidDeaths$ as dea
join covidVaccinations$ as vac
on dea.date=vac.date
and dea.location=vac.location
where dea.continent is not NULL 
group by dea.location,dea.population
order by 2 DESC

--checking the vaccination status and different columns from our vaccinations table

select dea.location,dea.continent,dea.date,vac.total_vaccinations,vac.new_vaccinations,vac.people_fully_vaccinated,vac.people_vaccinated,vac.total_boosters,dea.population
from covidVaccinations$ as vac
join covidDeaths$ as dea
on vac.date=dea.date
and vac.location=dea.location
where dea.continent is not NULL and dea.location='Gibraltar'
order by dea.location,dea.date

--Percentage of fully vaccinated people by location.
select dea.location,MAX(cast(vac.people_fully_vaccinated as int)) as CountFullyVaccinated,dea.population,MAX( (cast(vac.people_fully_vaccinated as int))/dea.population)*100 as Percentage_fully_Vaccinated
from covidDeaths$ as dea
join covidVaccinations$ as vac
on dea.date=vac.date
and dea.location=vac.location
where dea.continent is not NULL
group by dea.location,dea.population
order by 4 desc

--creating view to store data for visualisations

create view PercentFullyVaccinated as
select dea.location,MAX(cast(vac.people_fully_vaccinated as int)) as CountFullyVaccinated,dea.population,MAX( (cast(vac.people_fully_vaccinated as int))/dea.population)*100 as Percentage_fully_Vaccinated
from covidDeaths$ as dea
join covidVaccinations$ as vac
on dea.date=vac.date
and dea.location=vac.location
where dea.continent is not NULL
group by dea.location,dea.population
--order by 4 desc