SELECT avg(value) AS hours,
         COUNT(*) AS records,
      nationalocc AS occupation
FROM  adjtable AS adj
INNER JOIN   geography AS g   ON    g.guid = adj.geo
INNER JOIN      gender AS gen ON gen.genid = adj.gender
INNER JOIN   hourswork AS hw  ON   hw.hwid = adj.hours
INNER JOIN nationalocc AS noc ON noc.nocid = adj.occupation
WHERE          g.geo = 'Canada'
      AND gen.gender = 'Females'
	  AND value IS NOT NULL
    AND  hw.worked = 'Average actual hours (all workers, main job)'
GROUP BY nationalocc
ORDER BY hours DESC
