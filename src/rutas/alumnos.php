<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\RequestHandlerInterface as RequestHandler;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;
use Firebase\JWT\JWT;

$app = AppFactory::create();

$app->group('/api', function (RouteCollectorProxy $group){
    $group->group('/v1', function (RouteCollectorProxy $group){
        $group->get('/test', function (Request $request, Response $response, $args){
            $jwt = auth::generarJWT();
            var_dump($jwt);
            // $tiempo = time();
            // // $llave = 'mi_llave';

            // $token = array(
            //     'iat' => $tiempo,
            //     'exp' => $tiempo + 60,
            //     'data' => [
            //         'id' => 1,
            //         'nombre' => 'Eduardo'
            //     ]
            // );

            // $jwt = JWT::encode($token, $key);

            // $data = JWT::decode($jwt, $llave, array('HS256'));

            // var_dump($data);
            // var_dump($jwt);
            $response->getBody()->write('{"respuesta":"funciona"}');
            // $response->getBody()->write($jwt);
            return $response;
        });
        $group->get('/alumnos', function (Request $request, Response $response, $args) {
            $sql = "SELECT * FROM alumnos";
    
            try {
                $db = new db();
                $db = $db->conexionDB();
    
                $stmt = $db->prepare($sql);
                $stmt->execute();
    
                if($stmt->rowCount() > 0){
                    $alumnos = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    // print_r($alumnos);
    
                    $json = json_encode($alumnos);
                    // print_r (json_last_error());
    
                    $response->withHeader('Content-Type', 'application/json');
                    $response->getBody()->write($json);
                    return $response;
                }else{
                    $payload = '{"respuesta":"no hay datos"}';
                    $response->getBody()->write($payload);
                    return $response;
                }
    
                $stmt = null;
                $db = null;
    
            } catch (PDOException $e) {
                // $payload = "exception";
                $payload = '{"error":{"text":'.$e->getMessage().'}}';
                $response->getBody()->write($payload);
                return $response;
            }
        });
        $group->get('/alumnos/{id}', function (Request $request, Response $response, $args){
            $id_alumno = $request->getAttribute('id');

            $sql = "SELECT * FROM alumnos WHERE id = $id_alumno";

            try {
                $db = new db();
                $db = $db->conexionDB();

                $stmt = $db->prepare($sql);
                $stmt->execute();

                if($stmt->rowCount() > 0){
                    $alumno = $stmt->fetchAll(PDO::FETCH_ASSOC);

                    $json = json_encode($alumno);

                    $response->withHeader('Content-Type', 'application/json');
                    $response->getBody()->write($json);
                    return $response;
                }else{
                    $payload = '{"respuesta":"no hay datos"}';
                    $response->getBody()->write($payload);
                    return $response;
                }
            } catch (PDOException $e) {
                $payload = '{"error":{"text":'.$e->getMessage().'}}';
                $response->getBody()->write($payload);
                return $response;
            }
        });
        $group->post('/alumnos/nuevo', function (Request $request, Response $response, $args){
            // $datos = $request->getParsedBody();

            $datos = json_decode(file_get_contents('php://input'), true);
            $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
            $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
            $matricula = filter_var($datos['matricula'], FILTER_SANITIZE_STRING);
            $rfid = filter_var($datos['rfid'], FILTER_SANITIZE_STRING);
            
            $sql = "INSERT INTO alumnos (nombre, carrera, matricula, rfid) VALUES 
                    (:nombre,
                    :carrera, 
                    :matricula, 
                    :rfid)";

            try {
                $db = new db();
                $db = $db->conexionDB();

                $stmt = $db->prepare($sql);

                $stmt->bindParam(':nombre', $nombre);
                $stmt->bindParam(':carrera', $carrera);
                $stmt->bindParam(':matricula', $matricula);
                $stmt->bindParam(':rfid', $rfid);

                $stmt->execute();

                $response->withHeader('Content-Type', 'application/json');
                $payload = '{"respuesta":"nuevo alumno guardado"}';
                $response->getBody()->write($payload);
                return $response;
            } catch (PDOException $e) {
                $payload = '{"error":{"text":'.$e->getMessage().'}}';
                $response->getBody()->write($payload);
                return $response;
            }
        });
        $group->post('/alumnos/registro', function (Request $request, Response $response, $args){
            // $datos = $request->getParsedBody();

            $datos = json_decode(file_get_contents('php://input'), true);
            $rfid = filter_var($datos['rfid'], FILTER_SANITIZE_STRING);
            $accion = filter_var($datos['accion'], FILTER_SANITIZE_STRING);

            $sql = "INSERT INTO registros (rfid, fecha, hora, accion) VALUES 
                    (:rfid, 
                    CURDATE(), 
                    CURTIME(), 
                    :accion)";

            try {
                $db = new db();
                $db = $db->conexionDB();

                $stmt = $db->prepare($sql);

                $stmt->bindParam(':rfid', $rfid);
                $stmt->bindParam(':accion', $accion);

                $stmt->execute();

                $response->withHeader('Content-Type', 'application/json');
                $payload = '{"respuesta":"nuevo registro guardado"}';
                $response->getBody()->write($payload);
                return $response;
            } catch (PDOException $e) {
                $payload = '{"error":{"text":'.$e->getMessage().'}}';
                $response->getBody()->write($payload);
                return $response;
            }
        });
        $group->put('/alumnos/modificar', function (Request $request, Response $response, $args){
            
            // parse_str($request->getBody()->getContents(), $datos);

            $datos = json_decode(file_get_contents('php://input'), true);
            $id_alumno = filter_var($datos['id'], FILTER_SANITIZE_STRING);
            $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
            $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
            $matricula = filter_var($datos['matricula'], FILTER_SANITIZE_STRING);
            $rfid = filter_var($datos['rfid'], FILTER_SANITIZE_STRING);

            $sql = "UPDATE alumnos SET 
                    nombre = :nombre, 
                    carrera = :carrera, 
                    matricula = :matricula, 
                    rfid = :rfid WHERE id = :id";
            
            try {
                $db = new db();
                $db = $db->conexionDB();

                $stmt = $db->prepare($sql);

                $stmt->bindParam(':nombre', $nombre);
                $stmt->bindParam(':carrera', $carrera);
                $stmt->bindParam(':matricula', $matricula);
                $stmt->bindParam(':rfid', $rfid);
                $stmt->bindParam(':id', $id_alumno);

                $stmt->execute();

                $response->withHeader('Content-Type', 'application/json');
                $response->getBody()->write(json_encode("datos de alumno modificados"));
                return $response;
            } catch (PDOException $e) {
                $payload = '{"error":{"text":'.$e->getMessage().'}}';
                $response->getBody()->write($payload);
                return $response;
            }
        });
        $group->delete('/alumnos/borrar', function (Request $request, Response $response, $args){
            
            // parse_str($request->getBody()->getContents(), $datos);

            $datos = json_decode(file_get_contents('php://input'), true);
            $id_alumno = filter_var($datos['id'], FILTER_SANITIZE_STRING);

            $sql = "DELETE FROM alumnos WHERE id = :id";
            
            try {
                $db = new db();
                $db = $db->conexionDB();

                $stmt = $db->prepare($sql);

                $stmt->bindParam(':id', $id_alumno);

                $stmt->execute();

                $response->withHeader('Content-Type', 'application/json');
                $response->getBody()->write('{"respuesta":"datos de alumno borrados"}');
                return $response;
            } catch (PDOException $e) {
                $payload = '{"error":{"text":'.$e->getMessage().'}}';
                $response->getBody()->write($payload);
                return $response;
            }
        });
    });
});


$app->run();