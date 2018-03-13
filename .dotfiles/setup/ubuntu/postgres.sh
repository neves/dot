sudo apt -y install postgresql pgcli
# o usuario precisa ser o mesmo do sistema
sudo -u postgres psql -c "create role neves with SUPERUSER LOGIN CREATEROLE CREATEDB PASSWORD 'neves'"
# o banco de dados precisa ter o mesmo nome do usuário
sudo -u postgres psql -c "create database neves"
# No postgres, o equivalente ao database do MySql se chama schema
