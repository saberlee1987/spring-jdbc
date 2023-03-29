create procedure registerPerson(in u_name varchar(200),
                                in u_username varchar(200),
                                in u_password varchar(200),
                                in u_cityId int,
                                in u_statusCode tinyint,
                                out u_reg_status int
)

BEGIN
    DECLARE u_count int default 0;
    set u_reg_status = 0;
    select count(*) into u_count from users where username = u_username;
    if u_count < 1 then
        select count(*) into u_count from cities where id = u_cityId;
        if u_count > 0 then
            insert into users(name, username, password, city_id, status_code, created_at, updated_at)
            VALUES (u_name, u_username, u_password, u_cityId, u_statusCode, current_timestamp, current_timestamp);
            set u_reg_status = last_insert_id();
        end if;
    end if;
end;