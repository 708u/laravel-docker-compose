# laravel-docker-compose
Build develop environment of laravel  application

## Usage

### Create New Application

```bash
git clone git@github.com:naoyaUda/laravel-docker-compose.git
cd laravel-docker-compose
make create-laravel-app
cp -r src /path/to/your/app/name
```

### Installation

```bash
cd your-app-name
vi .env.example
- APP_NAME=laravel
+ APP_NAME=YOUR_APP_NAME
- DB_HOST=127.0.0.1
+ DB_HOST=mysql
- DB_PASSWORD=
+ DB_PASSWORD=PASSWORD

make install
```
