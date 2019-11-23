<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\RequestHandlerInterface as RequestHandler;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;

$app = AppFactory::create();

$app->group('/api', function (RouteCollectorProxy $group){
    $group->group('/v1', function (RouteCollectorProxy $group){
        $group->get('/test', function (Request $request, Response $response, $args){
            $response->getBody()->write(json_encode('funciona'));
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
                    // $payload = "no hay datos";
                    $payload = json_encode("no hay datos");
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
                    $payload = json_encode("no hay datos");
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
            $datos = $request->getParsedBody();
            $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
            $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
            $matricula = filter_var($datos['matricula'], FILTER_SANITIZE_STRING);
            $rfid = filter_var($datos['rfid'], FILTER_SANITIZE_STRING);
            
            $sql = "INSERT INTO alumnos (nombre, carrera, matricula, rfid) VALUES (:nombre, :carrera, :matricula, :rfid)";

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
                $response->getBody()->write(json_encode("nuevo alumno guardado"));
                return $response;
            } catch (PDOException $e) {
                $payload = '{"error":{"text":'.$e->getMessage().'}}';
                $response->getBody()->write($payload);
                return $response;
            }
        });
        $group->post('/alumnos/entrada', function (Request $request, Response $response, $args){
            $datos = $request->getParsedBody();
            $rfid = filter_var($datos['rfid'], FILTER_SANITIZE_STRING);

            $sql = "INSERT INTO registros (rfid, fecha, hora_entrada) VALUES (:rfid, CURDATE(), CURTIME())";

            try {
                $db = new db();
                $db = $db->conexionDB();

                $stmt = $db->prepare($sql);

                $stmt->bindParam(':rfid', $rfid);

                $stmt->execute();

                $response->withHeader('Content-Type', 'application/json');
                $response->getBody()->write(json_encode("nuevo registro guardado"));
                return $response;
            } catch (PDOException $e) {
                $payload = '{"error":{"text":'.$e->getMessage().'}}';
                $response->getBody()->write($payload);
                return $response;
            }
        });
        $group->put('/alumnos/modificar/{id}', function (Request $request, Response $response, $args){
            
            $id_alumno = $request->getAttribute('id');
            
            parse_str($request->getBody()->getContents(), $datos);
            
            $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
            $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
            $matricula = filter_var($datos['matricula'], FILTER_SANITIZE_STRING);
            $rfid = filter_var($datos['rfid'], FILTER_SANITIZE_STRING);

            $sql = "UPDATE alumnos SET nombre = :nombre, carrera = :carrera, matricula = :matricula, rfid = :rfid WHERE id = :id";
            
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
    });
});


$app->run();