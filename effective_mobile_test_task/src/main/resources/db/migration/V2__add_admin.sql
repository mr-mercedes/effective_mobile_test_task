INSERT INTO users (id, archive, email, name, password, role)
VALUES (1, false, 'mail@mail.ru', 'admin', '$2a$10$12CCzfbC.uWaWwYf4bCsDe.OM6gXuAXxtb/4UIdk8Vv2ibitcFqk.', 'ADMIN');

ALTER SEQUENCE user_seq RESTART WITH 2;