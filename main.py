import psycopg2


def create_table(cur):
    create_table1_querry = """
        CREATE TABLE IF NOT EXISTS client (
            client_id SERIAL PRIMARY KEY NOT NULL UNIQUE,
            name VARCHAR(255) NOT NULL, 
            surname VARCHAR(255) NOT NULL, 
            email VARCHAR(255) NOT NULL UNIQUE
        );
        """
    create_table2_querry = """
        CREATE TABLE IF NOT EXISTS phone (
            phone_id SERIAL PRIMARY KEY NOT NULL UNIQUE,
            phone int NOT NULL UNIQUE,
            client_id int REFERENCES client(client_id)            
        );
        """
    try:
        cur.execute(create_table1_querry)
        cur.execute(create_table2_querry)
        print('Table created successfully')
    except psycopg2.Error as e:
        print("Error creating table:", e)


def insert_into_table(cur, name, surname, email):
    insert_into_table_querry = """
        INSERT INTO client (name, surname, email) VALUES (%s, %s, %s);
    """
    try:
        cur.execute(insert_into_table_querry, (name, surname, email))
        print('Data inserted successfully')
    except psycopg2.Error as e:
        print("Error inserting into table:", e)


def insert_phone(cur, phone, client_id):
    insert_phone_querry = """
        INSERT INTO phone (phone, client_id) VALUES (%s, %s);
    """
    try:
        cur.execute(insert_phone_querry, (phone, client_id))
        print('Data inserted successfully')
    except psycopg2.Error as e:
        print("Error inserting into table:", e)


def update_phone(cur, phone, client_id):
    update_table_querry = """
       UPDATE phone
       SET phone = %s
       WHERE client_id = %s;
    """
    try:
        cur.execute(update_table_querry, (phone, client_id))
        print('Data updated successfully')
    except psycopg2.Error as e:
        print("Error updating data:", e)


def update_client(cur, client_id, **kwargs):
    valid_fields = ['name', 'surname', 'email']
    updates = []
    values = []

    for key, value in kwargs.items():
        if key in valid_fields:
            updates.append(f"{key} = %s")
            values.append(value)
        else:
            print(f"Ignoring invalid field: {key}")

    if not updates:
        print("No valid fields provided for update.")
        return

    update_query = f"""
        UPDATE client
        SET {', '.join(updates)}
        WHERE client_id = %s;
    """
    values.append(client_id)

    try:
        cur.execute(update_query, values)
        print("Client information updated successfully.")
    except psycopg2.Error as e:
        print("Error updating client information:", e)


def delete_row(cur, client_id):
    delete_querry = """
        DELETE FROM client
        WHERE client_id = %s;
    """
    try:
        cur.execute(delete_querry, (client_id))
        print('Data deleted successfully')
    except psycopg2.Error as e:
        print("Error deleting data:", e)


def find_client(cur, **kwargs):
    valid_identifiers = ['email', 'phone', 'name', 'surname']
    conditions = []
    values = []

    for key, value in kwargs.items():
        if key in valid_identifiers:
            if key == 'phone':
                conditions.append("phone.phone = %s")
            else:
                conditions.append(f"client.{key} = %s")
            values.append(value)
        else:
            print(f"Invalid identifier: {key}")

    if not conditions:
        print("No valid search criteria provided.")
        return

    find_query = """
        SELECT client.*, phone.phone FROM client
        LEFT JOIN phone ON client.client_id = phone.client_id
        WHERE {}
    """.format(" AND ".join(conditions))

    try:
        cur.execute(find_query, values)
        result = cur.fetchall()
        print(result)
    except psycopg2.Error as e:
        print("Error finding data:", e)

def main():
    conn = None
    try:
        with psycopg2.connect(database="client_db", user="postgres", password="kisharra") as conn:
            with conn.cursor() as cur:
                # create_table(cur)  # Функция, создающая структуру БД (таблицы)
                # insert_into_table(cur, "Ivan", "Ivanov", "email@example.com")  # Функция, позволяющая добавить нового клиента
                # insert_phone(cur, 1234567890, 1)  # Функция, позволяющая добавить телефон для существующего клиента
                # update_phone(cur, 345231313, 1)  # Функция, позволяющая изменить телефон для существующего клиента
                # update_client(cur, client_id=1, name='Petr')  # Функция, позволяющая изменить данные о клиенте
                # remove_phone(cur, 1)  # Функция, позволяющая удалить телефон для существующего клиента
                # delete_row(cur, 1)  # Функция, позволяющая удалить существующего клиента.
                # find_client(cur, ...) # Функция, позволяющая найти данные о клиенте. Enter name=, surname=, email=, phone=       
    except psycopg2.Error as e:
        print("Database error:", e)
    finally:
        if conn is not None:
            conn.close()

if __name__ == '__main__':
    main()
