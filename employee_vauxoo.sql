-- Your sql code in this file
-- NOTE: Please, don't add sentence to create database in this script file.
--       You can create database locally to test it.
--       Consider add ';' at end sentence.

		/* Se Crea Tabla Employee */
	CREATE TABLE EMPLOYEE(
		ID				integer NOT NULL,		/* ID_EMPLOYEE: CORRESPONDE AL PRIMARE KEY		*/
		ID_DEPARTMENT	integer NOT NULL,		/* ID_DEPARTMENT: CORRESPONDE AL FOREIGN KEY	*/
		FIRST_NAME		varchar(50) NULL,
		LAST_NAME		varchar(50) NULL,
	CONSTRAINT PK_EMPLOYEE PRIMARY KEY (ID) );
	
		/* Se Crea Tabla Employee_Department */
	CREATE TABLE EMPLOYEE_DEPARTMENT(
		ID				integer NOT NULL,		/* ID_DEPARTMENT: CORRESPONDE AL PRIMARE KEY	*/
		NAME			varchar(50) NULL,
		DESCRIPTION		varchar(150) NULL,
	CONSTRAINT PK_EMPLOYEE_DEPARTMENT PRIMARY KEY (ID) );
	
		/* Se Crea Tabla Employee_Hobby															*/
	CREATE TABLE EMPLOYEE_HOBBY(
		ID				integer NOT NULL,		/* ID_HOBBY: CORRESPONDE AL PRIMARY KEY			*/
		NAME			varchar(50) NULL,
		DESCRIPTION		varchar(150) NULL,
	CONSTRAINT PK_EEMPLOYEE_HOBBY PRIMARY KEY (ID) );
	
		/* Como corresponde a una Relación de Muchos a Muchos... es necesario tener una
		   tabla de relación entre el EMPLOYEE y EMPLOYEE_HOBBY									*/
	CREATE TABLE EMPLOYEE_HAS_HOBBY (
		ID_EMPLOYEE		integer,
		ID_HOBBY		integer,
	CONSTRAINT PK_EMPLOYEE_HAS_HOBBY PRIMARY KEY (ID_EMPLOYEE, ID_HOBBY) );
	
		/* Se hace la modificacion a la tabla EMPLOYEE  para asignarle el Deparment				*/
	ALTER TABLE EMPLOYEE
		ADD CONSTRAINT FK_EMPLOYEE_TO_DEPARTMENT FOREIGN KEY(ID_DEPARTMENT)
		REFERENCES EMPLOYEE_DEPARTMENT (ID)
		on delete restrict on update restrict;

		/* Se hacen las modificaciones necesarias a la tabla EMPLOYEE_HAS_HOBBY					*/
	ALTER TABLE EMPLOYEE_HAS_HOBBY
		ADD CONSTRAINT FK_EMPLOYEE_HAS_HOBBY_EMPLOYEE FOREIGN KEY(ID_EMPLOYEE)
		REFERENCES EMPLOYEE (ID)
		on delete restrict on update restrict;
		
	ALTER TABLE EMPLOYEE_HAS_HOBBY
		ADD CONSTRAINT FK_EMPLOYEE_HAS_HOBBY_EMPLOYEE_HOBBY FOREIGN KEY(ID_HOBBY)
		REFERENCES EMPLOYEE_HOBBY (ID)
		on delete restrict on update restrict;
		
		/* INSERCIÓN DE DATOS EN LA BASE DE DATOS												*/
		/* Se inserta datos a la tabla de EMPLOYEE_DEPARTMENT									*/
	insert into EMPLOYEE_DEPARTMENT ( ID, NAME, DESCRIPTION )
		values ( 10, 'DEPART_10', 'DESCRIPTION OF DEPARTMENT_10' );
	insert into EMPLOYEE_DEPARTMENT ( ID, NAME, DESCRIPTION )
		values ( 20, 'DEPART_20', 'DESCRIPTION OF DEPARTMENT_20' );
	insert into EMPLOYEE_DEPARTMENT ( ID, NAME, DESCRIPTION )
		values ( 30, 'DEPART_30', 'DESCRIPTION OF DEPARTMENT_30' );
	insert into EMPLOYEE_DEPARTMENT ( ID, NAME, DESCRIPTION )
		values ( 40, 'DEPART_40', 'DESCRIPTION OF DEPARTMENT_40' );
	insert into EMPLOYEE_DEPARTMENT ( ID, NAME, DESCRIPTION )
		values ( 50, 'DEPART_50', 'DESCRIPTION OF DEPARTMENT_50' );
	insert into EMPLOYEE_DEPARTMENT ( ID, NAME, DESCRIPTION )
		values ( 60, 'DEPART_60', 'DESCRIPTION OF DEPARTMENT_60' );
	
		/* Se inserta datos a la tabla de EMPLOYEE												*/
	insert into EMPLOYEE ( ID, ID_DEPARTMENT, FIRST_NAME, LAST_NAME )
		values (10, 10, 'JUAN', 'CRUZ' );
	insert into EMPLOYEE ( ID, ID_DEPARTMENT, FIRST_NAME, LAST_NAME )
		values (20, 10, 'MARIO', 'SANCHEZ' );
	insert into EMPLOYEE ( ID, ID_DEPARTMENT, FIRST_NAME, LAST_NAME )
		values (30, 20, 'VERONICA', 'ARIAS' );
	insert into EMPLOYEE ( ID, ID_DEPARTMENT, FIRST_NAME, LAST_NAME )
		values (40, 60, 'PABLO', 'PEREZ' );
	
		/* Se inserta datos a la tabla de EMPLOYEE_HOBBY										*/
	insert into EMPLOYEE_HOBBY ( ID, NAME, DESCRIPTION )
		values (100, 'BAILAR', 'PRACTICAR BAILE' );
	insert into EMPLOYEE_HOBBY ( ID, NAME, DESCRIPTION )
		values (200, 'DEPORTE', 'HACER DEPORTE COMO ACTIVIDAD RECREATIVA' );
	insert into EMPLOYEE_HOBBY ( ID, NAME, DESCRIPTION )
		values (300, 'AJEDREZ', 'JUGAR AJEDREZ' );
		
		/* Se inserta datos a la tabla de EMPLOYEE_HAS_HOBBY									*/
	insert into EMPLOYEE_HAS_HOBBY ( ID_EMPLOYEE, ID_HOBBY )
		values (10, 100 );
	insert into EMPLOYEE_HAS_HOBBY ( ID_EMPLOYEE, ID_HOBBY )
		values (10, 300 );
	insert into EMPLOYEE_HAS_HOBBY ( ID_EMPLOYEE, ID_HOBBY )
		values (20, 200 );
	insert into EMPLOYEE_HAS_HOBBY ( ID_EMPLOYEE, ID_HOBBY )
		values (30, 100 );
	insert into EMPLOYEE_HAS_HOBBY ( ID_EMPLOYEE, ID_HOBBY )
		values (30, 200 );
	insert into EMPLOYEE_HAS_HOBBY ( ID_EMPLOYEE, ID_HOBBY )
		values (40, 100 );
	insert into EMPLOYEE_HAS_HOBBY ( ID_EMPLOYEE, ID_HOBBY )
		values (40, 300 );
		
		/* Sql 3:
		 * Se hace la Modificación a la Tabla EMPLOYEE para Agregarle un JEFE					*/
	ALTER TABLE EMPLOYEE ADD COLUMN ID_BOSS integer NULL;
							/* ID_BOSS: CORRESPONDE AL ID_EMPLOYEE PARA ASIGNAR UN BOSS (Jefe)	*
							 * Este campo se agrega al final de la Tabla EMPLOYEE				*/
													 
		/* Ahora asignamos la Relación del Empleado con su JEFE									*/
	ALTER TABLE EMPLOYEE
		ADD CONSTRAINT FK_EMPLOYEE_HAS_BOSS FOREIGN KEY(ID_BOSS)
		REFERENCES EMPLOYEE (ID)
		on delete restrict on update restrict;
	
		/* Le asignamos vía Updtae de Tabla el Jefe a cada Empleado								*/
	UPDATE EMPLOYEE SET ID_BOSS = 10 WHERE ID IN ( 20, 30 );	/* Los empleados de ID 20 y 30 tienen como JEFE		*
																 * Al Empleado 10...								*/
																		 
	UPDATE EMPLOYEE SET ID_BOSS = 20 WHERE ID 	= 40;			/* El Empleado de ID 40 tienen como JEFE al			*
																 * Empleado 20...									*/
-- ...