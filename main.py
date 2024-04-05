import psycopg2


def create_table():
    create_table_querry = """
        CREATE TABLE IF NOT EXISTS client (
            id SERIAL PRIMARY KEY NOT NULL UNIQUE,
            name VARCHAR(255) NOT NULL, 
            surname VARCHAR(255) NOT NULL, 
            email VARCHAR(255) NOT NULL UNIQUE,
            phone int UNIQUE
        );
        """
    try:
        cur.execute(create_table_querry)
        conn.commit()
        print('Table created successfully')
    except psycopg2.Error as e:
        print("Error creating table:", e)


def insert_into_table(name, surname, email):
    insert_into_table_querry = """
        INSERT INTO client (name, surname, email) VALUES (%s, %s, %s);
    """
    try:
        cur.execute(insert_into_table_querry, (name, surname, email))
        conn.commit()
        print('Data inserted successfully')
    except psycopg2.Error as e:
        print("Error inserting into table:", e)


def update_phone(name, surname, email, phone):
    update_table_querry = """
       UPDATE client
       SET phone = %s
       WHERE name = %s AND surname = %s AND email = %s;
    """
    try:
        cur.execute(update_table_querry, (phone, name, surname, email))
        conn.commit()
        print('Data updated successfully')
    except psycopg2.Error as e:
        print("Error updating data:", e)


def update_table(id, name, surname, email, phone):
    update_table = """
        UPDATE client
        SET name = %s, surname = %s, email = %s, phone = %s
        WHERE id = %s;
    """
    try:
        cur.execute(update_table, (name, surname, email, phone, id))
        conn.commit()
        print('Data for all row updated successfully')
    except psycopg2.Error as e:
        print("Error updating data:", e)


def remove_phone(id, name, surname, email):
    remove_querry = """
        UPDATE client
        SET phone = NULL
        WHERE id = %s AND name = %s AND surname = %s AND email = %s;
    """
    try:
        cur.execute(remove_querry, (id, name, surname, email))
        conn.commit()
        print('Data deleted successfully')
    except psycopg2.Error as e:
        print("Error deleting data:", e)


def delete_row(id):
    delete_querry = """
        DELETE FROM client
        WHERE id = %s;
    """
    try:
        cur.execute(delete_querry, (id,))
        conn.commit()
        print('Data deleted successfully')
    except psycopg2.Error as e:
        print("Error deleting data:", e)


def find_client(name, surname, identifier, value):
    if identifier == 'email':
        find_querry = """
            SELECT * FROM client
            WHERE name = %s AND surname = %s AND email = %s;
        """
    elif identifier == 'phone':
        find_querry = """
            SELECT * FROM client
            WHERE name = %s AND surname = %s AND phone = %s;
        """
    else:
        print("Invalid identifier")
        return

    try:
        cur.execute(find_querry, (name, surname, value))
        result = cur.fetchall()
        print(result)
    except psycopg2.Error as e:
        print("Error finding data:", e)


try:
    with psycopg2.connect(database="client_db", user="postgres", password="kisharra") as conn:
        with conn.cursor() as cur:
            create_table()  # Функция, создающая структуру БД (таблицы)
            insert_into_table("Ivan", "Ivanov", "email@example.com")  # Функция, позволяющая добавить нового клиента
            update_phone("Ivan", "Ivanov", "email@example.com", 1234567890)  # Функция, позволяющая добавить телефон для существующего клиента
            update_table(1, "Petr", "Petrov", "gmail@example.com", 1987654321)  # Функция, позволяющая изменить данные о клиенте
            remove_phone(1, "Petr", "Petrov", "gmail@example.com")  # Функция, позволяющая удалить телефон для существующего клиента
            delete_row(1)  # Функция, позволяющая удалить существующего клиента.
            find_client("Ivan", "Ivanov", "email", "email@example.com")  # Функция, позволяющая найти клиента по его данным: имени, фамилии, email
            find_client("Ivan", "Ivanov", "phone", 1234567890)  # Функция, позволяющая найти клиента по его данным: имени, фамилии, телефон          
except psycopg2.Error as e:
    print("Database error:", e)
