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
        $group->group('/alumnos', function (RouteCollectorProxy $group){
            $group->get('/', function (Request $request, Response $response, $args) {
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
            $group->get('/{id}', function (Request $request, Response $response, $args){
                $id_alumno = $request->getAttribute('id');
    
                $sql = "SELECT * FROM alumnos WHERE id_alumno = :id";
    
                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
                    $stmt->bindParam(':id', $id_alumno);
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
            $group->post('/nuevo', function (Request $request, Response $response, $args){
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
            $group->put('/modificar', function (Request $request, Response $response, $args){
                
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
                        rfid = :rfid WHERE id_alumno = :id";
                
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
            $group->delete('/borrar', function (Request $request, Response $response, $args){
                
                // parse_str($request->getBody()->getContents(), $datos);
    
                $datos = json_decode(file_get_contents('php://input'), true);
                $id_alumno = filter_var($datos['id'], FILTER_SANITIZE_STRING);
    
                $sql = "DELETE FROM alumnos WHERE id_alumno = :id";
                
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
        $group->group('/registros', function (RouteCollectorProxy $group){
            $group->get('/', function (Request $request, Response $response, $args){
                $sql = "SELECT 
                        bitacora_alumnos.id_registro, 
                        bitacora_alumnos.rfid, 
                        bitacora_alumnos.laboratorio, 
                        bitacora_alumnos.fecha, 
                        bitacora_alumnos.hora, 
                        alumnos.nombre, 
                        alumnos.carrera, 
                        alumnos.matricula, 
                        practicas.nombre_practica, 
                        practicas.maestro,
                        practicas.sesiones FROM `bitacora_alumnos` 
                        INNER JOIN alumnos ON bitacora_alumnos.rfid = alumnos.rfid 
                        INNER JOIN  practicas ON bitacora_alumnos.id_practica = practicas.id_practica 
                        WHERE 1";
                
                try {
                    $db = new db();
                    $db = $db->conexionDB();
        
                    $stmt = $db->prepare($sql);
                    $stmt->execute();
        
                    if($stmt->rowCount() > 0){
                        $registros = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        $json = json_encode($registros);
        
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
                    $payload = '{"error":{"text":'.$e->getMessage().'}}';
                    $response->getBody()->write($payload);
                    return $response;
                }
            });
            $group->get('/{id}', function (Request $request, Response $response, $args){
                $id_registro = $request->getAttribute('id');

                $sql = "SELECT 
                        bitacora_alumnos.id_registro, 
                        bitacora_alumnos.rfid, 
                        bitacora_alumnos.laboratorio, 
                        bitacora_alumnos.fecha, 
                        bitacora_alumnos.hora, 
                        alumnos.nombre, 
                        alumnos.carrera, 
                        alumnos.matricula, 
                        practicas.nombre_practica, 
                        practicas.maestro,
                        practicas.sesiones FROM `bitacora_alumnos` 
                        INNER JOIN alumnos ON bitacora_alumnos.rfid = alumnos.rfid 
                        INNER JOIN  practicas ON bitacora_alumnos.id_practica = practicas.id_practica 
                        WHERE bitacora_alumnos.id_registro = :id";
                
                try {
                    $db = new db();
                    $db = $db->conexionDB();
        
                    $stmt = $db->prepare($sql);
                    $stmt->bindParam(':id', $id_registro);
                    $stmt->execute();
        
                    if($stmt->rowCount() > 0){
                        $registros = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        // print_r($registros);
        
                        $json = json_encode($registros);
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
                    $payload = '{"error":{"text":'.$e->getMessage().'}}';
                    $response->getBody()->write($payload);
                    return $response;
                }
            });
            $group->post('/nuevo', function (Request $request, Response $response, $args){
                
                $rfid = "sdaad12313";
                $laboratorio = "Automatización y Robótica";
                $fecha = "2019-12-01";
                $horas = array(1,2,3);
                // $fecha = date("Y-m-d");
                
                $sql = "SELECT * FROM practicas WHERE sesiones LIKE '%".$fecha."%'";
               
                try {
                    $db = new db();
                    $db = $db->conexionDB();
                    $stmt = $db->prepare($sql);
                    $stmt->execute();
                    
                    // // ésta consulta se hace para saber el id_práctica de la práctica en curso al momento
                    // // que el alumno hace el registro
                    if($stmt->rowCount() > 0){
                        $practicas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $id_practica = 0;
                        foreach($practicas as $practica){
                            $sesiones = json_decode($practica['sesiones'], true);
                            foreach($sesiones as $sesion){
                                if($sesion['fecha'] == $fecha and count(array_diff($sesion['horas'], $horas)) == 0){
                                    $id_practica = $practica['id_practica'];
                                    // print_r($id_practica);
                                }
                            }
                        }
                        
                        if($id_practica != 0){
                            $sql = "INSERT INTO bitacora_alumnos (rfid, laboratorio, fecha, hora, id_practica)
                                VALUES (:rfid, :laboratorio, CURDATE(), CURTIME(), :id_practica)";
                        
                            $stmt = $db->prepare($sql);

                            $stmt->bindParam(':rfid', $rfid);
                            $stmt->bindParam(':laboratorio', $laboratorio);
                            $stmt->bindParam(':id_practica', $id_practica);
                            $stmt->execute();

                            $payload = '{"respuesta":"nuevo registro guardado"}';
                            $response->withHeader('Content-Type','application/json');
                            $response->getBody()->write($payload);
                            return $response;
                        }else{
                            $payload = '{"respuesta":"no coincide la hora de registro"}';
                            $response->withHeader('Content-Type','application/json');
                            $response->getBody()->write($payload);
                            return $response;    
                        }
                    }else{
                        $payload = '{"respuesta":"no hay datos con la fecha indicada"}';
                        $response->getBody()->write($payload);
                        return $response;
                    }
                } catch (PDOException $e) {
                    $payload = '{"error":{"text":'.$e->getMessage().'}}';
                    $response->getBody()->write($payload);
                    return $response;
                }
            });
        });
    });
});


$app->run();