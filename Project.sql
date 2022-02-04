
with PopvsVac(Continent, location, date, population, new_vaccinations, Vacsinat)
as
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.location,
  dea.date) as Vacsinat
FROM project.covidvaccinations vac
join project.coviddeaths dea
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent is not null
)
SELECT * , ( Vacsinat / population)*100
FROM PopvsVac

DROP Table if exists #PercentPopulationVaccinated
Create Table #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
INSERT into
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(vac.new_vaccinations) OVER (Partition by dea.location ORDER BY dea.location,
  dea.date) as Vacsinat
FROM project.covidvaccinations vac
join project.coviddeaths dea
    ON dea.location = vac.location
    AND dea.date = vac.date
)
SELECT * , ( Vacsinat / population)*100
FROM PopvsVac


