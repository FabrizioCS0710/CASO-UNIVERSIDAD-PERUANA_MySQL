

-- 1
select a.nombre, a.descripcion from actividades as a
join sedes as s on s.id_sede = a.id_sede
where s.nombre = 'Sede Sur';

-- 2
select distinct s.nombre
from sedes s
join servicios serv on s.id_sede = serv.id_sede
join actividades a on s.id_sede = a.id_sede
where serv.tipo = 'gimnasio' and a.nombre = 'evento deportivo';

-- 3
select e.nombre_completo, s.telefono
from sedes s
join servicios serv on s.id_sede = serv.id_sede
join empleados e on s.persona_contacto_id = e.id_empleado
where serv.tipo in ('biblioteca', 'laboratorio');

-- 4
select a.nombre, a.descripcion
from actividades a
where a.dia_semana = 'lunes' and a.nivel_importancia > 7;

-- 5
select s.nombre, s.direccion
from sedes s
join empleados e on s.id_sede = e.id_sede
where e.dni like '%5';

-- 6
select serv.tipo, s.nombre
from servicios serv
join sedes s on serv.id_sede = s.id_sede
where serv.horario_disponibilidad = '8:00 AM - 10:00 PM';

-- 7
select*from sedes as s where id_sede not in (select a.id_sede from actividades as a
join sedes s on a.id_sede = s.id_sede);

-- 8
select distinct s.nombre
from sedes s
join servicios serv on s.id_sede = serv.id_sede
where serv.tipo in ('gimnasio', 'biblioteca');

-- 9
select s.nombre, count(e.id_empleado) as total_empleados
from sedes s
left join empleados e on s.id_sede = e.id_sede
group by s.id_sede;

-- 10
select s.nombre
from sedes s
join servicios serv on s.id_sede = serv.id_sede
where serv.capacidad_maxima > 100;

-- 11
select s.nombre, count(a.id_actividad) as total_actividades
from sedes s
join actividades a on s.id_sede = a.id_sede
group by s.id_sede
order by total_actividades desc;

-- 12
select a.nombre, s.nombre as sede
from actividades a
join sedes s on a.id_sede = s.id_sede
order by a.nivel_importancia desc;

-- 13
select e.nombre_completo
from empleados e
join sedes s on e.id_empleado = s.persona_contacto_id
join servicios serv on s.id_sede = serv.id_sede
group by s.id_sede
having count(serv.id_servicio) > 5;

-- 14
select s.nombre
from sedes s
join actividades a on s.id_sede = a.id_sede
group by s.id_sede
having avg(a.nivel_importancia) < 5;

-- 15
select s.nombre, count(serv.id_servicio) as total_laboratorios
from sedes s
join servicios serv on s.id_sede = serv.id_sede
where serv.tipo = 'laboratorio'
group by s.id_sede
order by total_laboratorios desc;

-- 16
select s.nombre
from sedes s
join servicios serv on s.id_sede = serv.id_sede
where serv.tipo in ('laboratorio', 'gimnasio')
group by s.id_sede
having count(serv.id_servicio) > 2;

-- 17
select avg(total_actividades) as promedio_actividades
from (
    select count(a.id_actividad) as total_actividades
    from sedes s
    left join actividades a on s.id_sede = a.id_sede
    group by s.id_sede
) as actividades_por_sede;

-- 18
select s.nombre
from sedes s
join actividades a on s.id_sede = a.id_sede
group by s.id_sede, a.dia_semana
having count(a.id_actividad) > 3;

-- 19
select distinct s.nombre, s.direccion
from sedes s
join servicios serv on s.id_sede = serv.id_sede
join actividades a on s.id_sede = a.id_sede
where a.nivel_importancia > 8;

-- 20
select s.nombre, count(a.id_actividad) as total_actividades, a.nombre as actividad_mas_frecuente
from sedes s
join actividades a on s.id_sede = a.id_sede
group by s.id_sede, a.nombre
order by total_actividades desc

