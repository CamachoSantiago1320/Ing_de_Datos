-- EJERCICIO QUIZ 
DELIMITER //

CREATE PROCEDURE insertarMascotaVacuna(
    IN p_codigoVacunaFK INT,
    IN p_idMascotaFK INT,
    IN p_enfermedad VARCHAR(15)
)
BEGIN
    INSERT INTO Mascota_Vacuna (codigoVacunaFK, idMascotaFK, enfermedad)
    VALUES (p_codigoVacunaFK, p_idMascotaFK, p_enfermedad);
END //

//DELIMITER; 

CALL insertarMascotaVacuna(301, 1, 'Rabia');
CALL insertarMascotaVacuna(302, 2, 'Moquillo');
CALL insertarMascotaVacuna(303, 3, 'Parvovirus');

DELIMITER //

CREATE PROCEDURE consultarVacunasMascota(
    IN p_idMascotaFK INT
)
BEGIN
    SELECT mv.idMascotaFK, m.nombreMascota, v.nombreVacuna, v.enfermedad
    FROM Mascota_Vacuna mv
    JOIN Vacuna v ON mv.codigoVacunaFK = v.codigoVacuna
    JOIN Mascota m ON mv.idMascotaFK = m.idMascota
    WHERE mv.idMascotaFK = p_idMascotaFK;
END //

// DELIMITER ;