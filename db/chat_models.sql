create table chat_models
(
    id    int auto_increment
        primary key,
    code  varchar(50) not null,
    model varchar(50) null
);

INSERT INTO chat_models (id, code, model) VALUES (1, 'gpt-3.5-turbo-0125', 'GPT 3.5');
INSERT INTO chat_models (id, code, model) VALUES (2, 'gpt-4-1106-preview', 'GPT 4');
