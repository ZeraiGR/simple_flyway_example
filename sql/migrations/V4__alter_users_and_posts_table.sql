WITH inserted_users AS (
    INSERT INTO users (name, email) VALUES 
    ('Иван Иванов', 'ivan.ivanov@example.com'),
    ('Анна Смирнова', 'anna.smirnova@example.com')
    RETURNING id, name
);

INSERT INTO posts (text, owner_id) 
SELECT 
    CASE 
        WHEN name = 'Иван Иванов' THEN 'Первый пост от Ивана Иванова'
        WHEN name = 'Анна Смирнова' THEN 'Первый пост от Анны Смирновой'
    END,
    id
FROM inserted_users;