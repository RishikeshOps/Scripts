#!/bin/bash

Create a file in a specifi path and add some conent into that file.
echo "Your cuurent directory is "
pwd
read -p "Enter you desired location here" location
echo "Now your current location is "
cd $location
pwd
read -p "Enter a file name: " filename
read -p "Enter extenison you want for the file: " exe
read -p "How Many File You want to create?? " end_no

seq 1 $end_no | xargs -I {} touch $filename{}.$exe
ls


#for i in $(seq 1 $end_no);
#do
#    touch "$filename-$i$exe"
#done

# -- CREATE USER readonly  WITH ENCRYPTED PASSWORD 'bounce@readonly';
# -- GRANT USAGE ON SCHEMA public to readonly;
# -- ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly;

# GRANT CONNECT ON DATABASE baas_service to readonly;
# -- \c baas_service
# ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly; --- this grants privileges on new tables generated in new database "foo"
# GRANT USAGE ON SCHEMA public to readonly; 
# GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO readonly;
# GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly;
