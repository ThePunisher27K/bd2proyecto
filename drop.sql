drop table TipoUsuarios;
delete from Usuario;
drop table Usuario;
alter table Usuario drop column us_tipous;
alter table Usuario drop column us_correo;
alter table Usuario drop column us_usuario;
drop table DatosActores;