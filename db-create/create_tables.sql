BEGIN;


CREATE TABLE IF NOT EXISTS public.orders
(
    order_id SERIAL NOT NULL,
    user_id integer NOT NULL,
    date timestamp NOT NULL DEFAULT NOW(),
    addres character varying,
    phone character varying,
    order_status integer,
    PRIMARY KEY (order_id)
);

CREATE TABLE IF NOT EXISTS public.status
(
    status_id SERIAL NOT NULL,
    status_name character varying,
    PRIMARY KEY (status_id)
);

CREATE TABLE IF NOT EXISTS public.order_list
(
    id SERIAL NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer NOT NULL,
    total_price integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.products
(
    product_id SERIAL NOT NULL,
    name character varying NOT NULL,
    description text,
    price integer NOT NULL,
    product_type integer NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE IF NOT EXISTS public.type
(
    type_id SERIAL NOT NULL,
    type_name character varying NOT NULL,
    PRIMARY KEY (type_id)
);


ALTER TABLE IF EXISTS public.orders
    ADD FOREIGN KEY (order_status)
    REFERENCES public.status (status_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_list
    ADD FOREIGN KEY (order_id)
    REFERENCES public.orders (order_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.order_list
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (product_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.products
    ADD FOREIGN KEY (product_type)
    REFERENCES public.type (type_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

INSERT INTO status (status_name) VALUES ('saved'), ('delivered');

INSERT INTO type (type_name) VALUES ('type_1'), ('type_2'), ('type_3'), ('type_4'), ('type_5');

END;

