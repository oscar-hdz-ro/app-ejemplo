SELECT 
    u.ID_Usuario,
    u.Nombre_Usuario,
    u.Departamento,
    a.ID_Acceso,
    a.Fecha_Acceso,
    a.Hora_Entrada,
    a.Hora_Salida,
    DATEDIFF(minute, a.Hora_Entrada, a.Hora_Salida) AS Tiempo_Permanencia_Minutos,
    CASE 
        WHEN DATEPART(hour, a.Hora_Entrada) < 9 OR DATEPART(hour, a.Hora_Salida) > 18 THEN 'Fuera de Horario'
        ELSE 'En Horario'
    END AS Rango_Horario,
    c.Dia_Semana,
    d.Nombre_Departamento
FROM 
    Accesos a
JOIN 
    Usuarios u ON a.ID_Usuario = u.ID_Usuario
JOIN 
    Calendario c ON a.Fecha_Acceso = c.Fecha
JOIN 
    Departamentos d ON u.Departamento = d.ID_Departamento
WHERE 
    c.Año = 2023  -- Filtra los datos del año 2023
ORDER BY 
    a.Fecha_Acceso, a.Hora_Entrada;
