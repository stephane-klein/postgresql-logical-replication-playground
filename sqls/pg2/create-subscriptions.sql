CREATE SUBSCRIPTION my_sub
    CONNECTION 'host=postgres1 port=5432 dbname=postgres user=postgres password=password'
    PUBLICATION my_pub;