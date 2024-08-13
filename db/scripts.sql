--ROLES
INSERT INTO public.roles (id, title, code, description, active, created_at, updated_at, url) VALUES ('d9afdd2c-2d35-4abf-b49b-8432326cf43d', 'Administrador', 'admin', '', true, CURRENT_DATE, CURRENT_DATE, '/pagina/administracion');
INSERT INTO public.roles (id, title, code, description, active, created_at, updated_at, url) VALUES ('d842efb2-b639-44e8-90fd-f0afffd2359b', 'Comisario de Familia', 'commissioner', '', true, CURRENT_DATE, CURRENT_DATE, '/pagina/bandeja_entrada');
INSERT INTO public.roles (id, title, code, description, active, created_at, updated_at, url) VALUES ('27582a15-3b4c-40ab-857d-9deb9fe4be76', 'Secretario de Despacho', 'secretary', '', true, CURRENT_DATE, CURRENT_DATE, '/pagina/bandeja_entrada');
INSERT INTO public.roles (id, title, code, description, active, created_at, updated_at, url) VALUES ('f417f4ac-142a-41c9-b6cd-7899e802b6a2', 'Psicologo', 'psychologist', '', true, CURRENT_DATE, CURRENT_DATE, '/pagina/bandeja_entrada');
INSERT INTO public.roles (id, title, code, description, active, created_at, updated_at, url) VALUES ('64c6ae78-1ff6-4949-a16c-d9dea3626c03', 'Trabajador Social', 'social_worker', '', true, CURRENT_DATE, CURRENT_DATE, '/pagina/bandeja_entrada');
INSERT INTO public.roles (id, title, code, description, active, created_at, updated_at, url) VALUES ('5f24ae85-fda3-451e-acf1-e8264c701c4e', 'Auxiliar Administrativo', 'aux_admin', '', true, CURRENT_DATE, CURRENT_DATE, '/contraseñaspagina/bandeja_entrada');


--PERMISSION
INSERT INTO public.permissions (id, title, description, active, created_at, updated_at, code) VALUES('e7e253a3-5af9-4293-88cb-0d2d848e862e', 'Acceso Bandeja de Entrada', 'Permite el acceso a la bandeja de entrada', true, CURRENT_DATE, CURRENT_DATE, 'access_dashboard');
INSERT INTO public.permissions (id, title, description, active, created_at, updated_at, code) VALUES('fd78461b-c828-44f0-9dd3-72197ca4c56c', 'Creación de Nuevos Procesos', 'Permite la creación de nuevos documentos', true, CURRENT_DATE, CURRENT_DATE, 'access_creation_document');
INSERT INTO public.permissions (id, title, description, active, created_at, updated_at, code) VALUES('3965aaf0-8e50-4777-871b-c86ff6777497', 'Busqueda de Denuncias', 'Permite ingresar al buscador consultar los procesos', true, CURRENT_DATE, CURRENT_DATE, 'access_search_documents');
INSERT INTO public.permissions (id, title, description, active, created_at, updated_at, code) VALUES('64794edb-5816-4989-a3c7-61550633a6aa', 'Administración del Portal', 'Permite parametrizar el portal web', true, CURRENT_DATE, CURRENT_DATE, 'access_administration');
INSERT INTO public.permissions (id, title, description, active, created_at, updated_at, code) VALUES(gen_random_uuid(), '', '', true, CURRENT_DATE, CURRENT_DATE, '');

--ROLE PERMISSIONS
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, 'd842efb2-b639-44e8-90fd-f0afffd2359b', 'e7e253a3-5af9-4293-88cb-0d2d848e862e');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, '27582a15-3b4c-40ab-857d-9deb9fe4be76', 'e7e253a3-5af9-4293-88cb-0d2d848e862e');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, 'f417f4ac-142a-41c9-b6cd-7899e802b6a2', 'e7e253a3-5af9-4293-88cb-0d2d848e862e');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, '64c6ae78-1ff6-4949-a16c-d9dea3626c03', 'e7e253a3-5af9-4293-88cb-0d2d848e862e');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, '5f24ae85-fda3-451e-acf1-e8264c701c4e', 'e7e253a3-5af9-4293-88cb-0d2d848e862e');

INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, 'd842efb2-b639-44e8-90fd-f0afffd2359b', 'fd78461b-c828-44f0-9dd3-72197ca4c56c');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, '27582a15-3b4c-40ab-857d-9deb9fe4be76', 'fd78461b-c828-44f0-9dd3-72197ca4c56c');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, 'f417f4ac-142a-41c9-b6cd-7899e802b6a2', 'fd78461b-c828-44f0-9dd3-72197ca4c56c');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, '64c6ae78-1ff6-4949-a16c-d9dea3626c03', 'fd78461b-c828-44f0-9dd3-72197ca4c56c');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, '5f24ae85-fda3-451e-acf1-e8264c701c4e', 'fd78461b-c828-44f0-9dd3-72197ca4c56c');

INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, 'd842efb2-b639-44e8-90fd-f0afffd2359b', '3965aaf0-8e50-4777-871b-c86ff6777497');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, '27582a15-3b4c-40ab-857d-9deb9fe4be76', '3965aaf0-8e50-4777-871b-c86ff6777497');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, 'f417f4ac-142a-41c9-b6cd-7899e802b6a2', '3965aaf0-8e50-4777-871b-c86ff6777497');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, '64c6ae78-1ff6-4949-a16c-d9dea3626c03', '3965aaf0-8e50-4777-871b-c86ff6777497');
INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, '5f24ae85-fda3-451e-acf1-e8264c701c4e', '3965aaf0-8e50-4777-871b-c86ff6777497');

INSERT INTO public.role_permissions (id, created_at, updated_at, role_id, permission_id) VALUES(gen_random_uuid(), CURRENT_DATE, CURRENT_DATE, 'd9afdd2c-2d35-4abf-b49b-8432326cf43d', '64794edb-5816-4989-a3c7-61550633a6aa');

--SIDEBAR
INSERT INTO public.sidebars (id, title, icon, "path", "order", sidebar_id, created_at, updated_at, permission_id) VALUES('d842efb2-b639-44e8-90fd-f0afffd2359b', 'Administracion', 'fas fa-plus-square', 'administracion', 1, null, CURRENT_DATE, CURRENT_DATE, '64794edb-5816-4989-a3c7-61550633a6aa');
INSERT INTO public.sidebars (id, title, icon, "path", "order", sidebar_id, created_at, updated_at, permission_id) VALUES('7dddbdef-b810-4823-acaf-80e337eb83b7', 'Bandeja de Entrada', 'fas fa-inbox', 'bandeja_entrada', 2, null, CURRENT_DATE, CURRENT_DATE, 'e7e253a3-5af9-4293-88cb-0d2d848e862e');
INSERT INTO public.sidebars (id, title, icon, "path", "order", sidebar_id, created_at, updated_at, permission_id) VALUES('95cd6804-796e-4722-93cc-575366e31c11', 'Registrar Denuncia', 'fas fa-plus-squarex', 'registrar_denuncia', 3, null, CURRENT_DATE, CURRENT_DATE, 'fd78461b-c828-44f0-9dd3-72197ca4c56c');
INSERT INTO public.sidebars (id, title, icon, "path", "order", sidebar_id, created_at, updated_at, permission_id) VALUES('27582a15-3b4c-40ab-857d-9deb9fe4be76', 'Buscador de Denuncias', 'fas fa-search', 'buscador_denuncias',4, null, CURRENT_DATE, CURRENT_DATE, '3965aaf0-8e50-4777-871b-c86ff6777497');
 

-- MODEL PAGE
INSERT INTO public.model_pages (id, "name", active, created_at, updated_at, code) VALUES('18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26', 'Infancia y Adolescencia', true, CURRENT_DATE, CURRENT_DATE, 'IA');
INSERT INTO public.model_pages (id, "name", active, created_at, updated_at, code) VALUES('2b56f760-a617-4e1d-a89b-e3dc81cd3b18', 'Tercera Edad', true, CURRENT_DATE, CURRENT_DATE, 'TE');
INSERT INTO public.model_pages (id, "name", active, created_at, updated_at, code) VALUES('a60ca1bb-f525-4b2f-850d-f4373c7c8314', 'Violencia Intrafamiliar', true, CURRENT_DATE, CURRENT_DATE, 'VI');


--EPS
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'COOSALUD', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'NUEVA EPS', CURRENT_DATE, CURRENT_DATE); 
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'MUTUAL SER', CURRENT_DATE, CURRENT_DATE); 
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'ALIANSALUD', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'SALUD TOTAL EPS S.A.', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'EPS SANITAS', CURRENT_DATE, CURRENT_DATE); 
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'EPS SURA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'FAMISANAR', CURRENT_DATE, CURRENT_DATE); 
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'SERVICIO OCCIDENTAL DE SALUD EPS', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'SALUD MIA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'COMFENALCO VALLE', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'COMPENSAR EPS', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'EPM - EMPRESAS PUBLICAS DE MEDELLIN', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'FONDO DE PASIVO SOCIAL DE FERROCARRILES NACIONALES DE COLOMBIA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'CAJACOPI ATLANTICO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'CAPRESOCA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'COMFACHOCO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'COMFAMILIAR DE LA GUAJIRA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'COMFAORIENTE', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'EPS FAMILIAR DE COLOMBIA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'ASMET SALUD', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'ECOOPSOS ESS EPS-S', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'EMSSANAR E.S.S.', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'CAPITAL SALUD EPS-S', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'SAVIA SALUD EPS', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'DUSAKAWI EPSI', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'ASOCIACION INDIGENA DEL CAUCA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'ANAS WAYUU EPSI', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'MALLAMAS EPSI', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.health_promoting_entities (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'PIJAOS SALUD EPSI', CURRENT_DATE, CURRENT_DATE);

--DOCUMENT TYPE
INSERT INTO public.document_types (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'CEDULA DE CIUDADANIA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.document_types (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'CEDULA DE EXTRANJERIDA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.document_types (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'TARJETA DE IDENTIDAD', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.document_types (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'PASAPORTE', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.document_types (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'REGISTRO CIVIL', CURRENT_DATE, CURRENT_DATE);

--PERSON TYPES

INSERT INTO public.person_types (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'SOLICITANTE', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.person_types (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'VICTIMA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.person_types (id, "name", created_at, updated_at) VALUES(gen_random_uuid(), 'PRESUNTO AGRESOR', CURRENT_DATE, CURRENT_DATE);

--RELATIONSHIP TYPES

INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'COMPAÑERO PERMANENTE', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'PADRE', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'MADRE', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'HIJO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'HIJA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'HERMANO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'HERMANA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'PADRASTO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'MADRASTA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'PRIMO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'PRIMA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'TIO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'TIA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'ABUELO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'ABUELA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'SOBRINO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'SOBRINA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'EXPAREJA', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'EL O ELLA MISMO', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.relationship_types (id, name, created_at, updated_at) VALUES (gen_random_uuid(), 'OTRO', CURRENT_DATE, CURRENT_DATE);


--STEPS
INSERT INTO public.steps(id, code, title, created_at, updated_at) VALUES('696ba073-b034-4912-84d6-dfffa7d5e736', 'created', 'Registrado', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.steps(id, code, title, created_at, updated_at) VALUES('995b5e72-5708-43b5-82d8-cbbb51e8def0', 'registered_persons', 'Sujetos Procesales Registrados', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.steps(id, code, title, created_at, updated_at) VALUES('82aaa38c-ad94-4a6c-afec-ed4f0586b135', 'in_process', 'Tramite', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.steps(id, code, title, created_at, updated_at) VALUES('1e12ac2f-460d-4a31-bd50-51ebea3980de', 'waiting_for', 'En Espera', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.steps(id, code, title, created_at, updated_at) VALUES('9bfb2381-2608-4a2e-9235-7959f9570496', 'in_psychosocial_study', 'En Estudio Psicosocial', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.steps(id, code, title, created_at, updated_at) VALUES('cc4c10d3-323e-4d75-88f6-15fed8beef77', 'review', 'En Revisión', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.steps(id, code, title, created_at, updated_at) VALUES('8c4e6360-cf0b-49b0-9f2f-d000ff5de6ac', 'reject', 'Rechazado', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.steps(id, code, title, created_at, updated_at) VALUES('9a774ec2-6fb5-4947-8ac7-1e847479beaf', 'finished', 'Finalizado', CURRENT_DATE, CURRENT_DATE);

-- 

--WORK FLOW STEPS - Infancia y Adolescencia
--creado a creado
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '696ba073-b034-4912-84d6-dfffa7d5e736', '696ba073-b034-4912-84d6-dfffa7d5e736', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '696ba073-b034-4912-84d6-dfffa7d5e736', '696ba073-b034-4912-84d6-dfffa7d5e736', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '696ba073-b034-4912-84d6-dfffa7d5e736', '696ba073-b034-4912-84d6-dfffa7d5e736', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--involucrados registrados a en tramite
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '995b5e72-5708-43b5-82d8-cbbb51e8def0', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '995b5e72-5708-43b5-82d8-cbbb51e8def0', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '995b5e72-5708-43b5-82d8-cbbb51e8def0', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--En tramite a en Espera
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '82aaa38c-ad94-4a6c-afec-ed4f0586b135', '1e12ac2f-460d-4a31-bd50-51ebea3980de', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '82aaa38c-ad94-4a6c-afec-ed4f0586b135', '1e12ac2f-460d-4a31-bd50-51ebea3980de', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '82aaa38c-ad94-4a6c-afec-ed4f0586b135', '1e12ac2f-460d-4a31-bd50-51ebea3980de', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--Espera a en tramite
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '1e12ac2f-460d-4a31-bd50-51ebea3980de', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '1e12ac2f-460d-4a31-bd50-51ebea3980de', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '1e12ac2f-460d-4a31-bd50-51ebea3980de', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--En tramite a en Estudio psicosocial
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '82aaa38c-ad94-4a6c-afec-ed4f0586b135', '9bfb2381-2608-4a2e-9235-7959f9570496', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '82aaa38c-ad94-4a6c-afec-ed4f0586b135', '9bfb2381-2608-4a2e-9235-7959f9570496', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '82aaa38c-ad94-4a6c-afec-ed4f0586b135', '9bfb2381-2608-4a2e-9235-7959f9570496', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--Estudio psicosocial a en tramite
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '9bfb2381-2608-4a2e-9235-7959f9570496', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '9bfb2381-2608-4a2e-9235-7959f9570496', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '9bfb2381-2608-4a2e-9235-7959f9570496', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--Tramite a Revision
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '82aaa38c-ad94-4a6c-afec-ed4f0586b135', 'cc4c10d3-323e-4d75-88f6-15fed8beef77', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '82aaa38c-ad94-4a6c-afec-ed4f0586b135', 'cc4c10d3-323e-4d75-88f6-15fed8beef77', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '82aaa38c-ad94-4a6c-afec-ed4f0586b135', 'cc4c10d3-323e-4d75-88f6-15fed8beef77', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--Revision a Rechazado
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), 'cc4c10d3-323e-4d75-88f6-15fed8beef77', '8c4e6360-cf0b-49b0-9f2f-d000ff5de6ac', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), 'cc4c10d3-323e-4d75-88f6-15fed8beef77', '8c4e6360-cf0b-49b0-9f2f-d000ff5de6ac', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), 'cc4c10d3-323e-4d75-88f6-15fed8beef77', '8c4e6360-cf0b-49b0-9f2f-d000ff5de6ac', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--Rechazado a En Tramite
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '8c4e6360-cf0b-49b0-9f2f-d000ff5de6ac', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '8c4e6360-cf0b-49b0-9f2f-d000ff5de6ac', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), '8c4e6360-cf0b-49b0-9f2f-d000ff5de6ac', '82aaa38c-ad94-4a6c-afec-ed4f0586b135', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--Revision a finalizado
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), 'cc4c10d3-323e-4d75-88f6-15fed8beef77', '9a774ec2-6fb5-4947-8ac7-1e847479beaf', CURRENT_DATE, CURRENT_DATE, '18c6a7d1-faf7-40c6-bc41-1cf2a5a0ac26');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), 'cc4c10d3-323e-4d75-88f6-15fed8beef77', '9a774ec2-6fb5-4947-8ac7-1e847479beaf', CURRENT_DATE, CURRENT_DATE, '2b56f760-a617-4e1d-a89b-e3dc81cd3b18');
INSERT INTO public.work_flow_steps (id, previos_step, next_step, created_at, updated_at, model_page_id) VALUES(gen_random_uuid(), 'cc4c10d3-323e-4d75-88f6-15fed8beef77', '9a774ec2-6fb5-4947-8ac7-1e847479beaf', CURRENT_DATE, CURRENT_DATE, 'a60ca1bb-f525-4b2f-850d-f4373c7c8314');

--TIPOS
INSERT INTO public.page_control_types (id, name, created_at, updated_at) VALUES(gen_random_uuid(), 'Digitalizacion', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.page_control_types (id, name, created_at, updated_at) VALUES(gen_random_uuid(), 'Electronico', CURRENT_DATE, CURRENT_DATE);
INSERT INTO public.page_control_types (id, name, created_at, updated_at) VALUES(gen_random_uuid(), 'Fisico', CURRENT_DATE, CURRENT_DATE);


