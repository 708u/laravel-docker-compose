# laravel-docker-compose

Build develop environment of laravel application.

## Usage

### Create New Application

```bash
$ git clone git@github.com:naoyaUda/laravel-docker-compose.git
$ cd laravel-docker-compose
$ make
$ cp -r src /path/to/your/app/name
```
- option
  - You can choose version of intallation laraecl flamework. e.g.

```
$ make        // Install laravel latest
$ make v=7    // Install laravel 7.0.0
$ make v=6.12 // Install laravel 6.12
```

### Installation

```bash
$ cd your-app-name
$ vi .env.example

>>>
- PROJECT=project-name
+ PROJECT=YOUR_APP_NAME
- DB_HOST=127.0.0.1
+ DB_HOST=mysql
- DB_PASSWORD=
+ DB_PASSWORD=PASSWORD
- REDIS_HOST=127.0.0.1
+ REDIS_HOST=redis
<<<

$ make install
```

### Using XDebug

- Simply copy .vscode directory to your app. You can use XDebug on vs code.

```bash
$ cp .vscode /pass/to/your/app
$ echo .vscode/ >> .gitignore
```

### E2E test with laravel Dusk

- First, Install laravel dusk.

```bash
$ make composer
$ composer require --dev laravel/dusk
$ exit
$ make app
$ php artisan dusk:install
```

- TODO: write dusk config and how to fix DuskTestCase.
