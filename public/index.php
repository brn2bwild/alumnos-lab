<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\RequestHandlerInterface as RequestHandler;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;
use Firebase\JWT\JWT;

require __DIR__ . '/../vendor/autoload.php';

require __DIR__ . '/../src/config/db.php';

require __DIR__ . '/../src/secrets/secrets.php';

require __DIR__ . '/../src/rutas/alumnos.php';