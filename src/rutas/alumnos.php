<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\RequestHandlerInterface as RequestHandler;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;
use Firebase\JWT\JWT;

$app = AppFactory::create();
$app->setBasePath('/alumnos-lab');
$app->addRoutingMiddleware();

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
            $group->get('', function (Request $request, Response $response, $args) {
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
            $group->get('/{parametro}/{valor}', function (Request $request, Response $response, $args){
                $parametro = filter_var($request->getAttribute('parametro'), FILTER_SANITIZE_STRING);
                $valor = filter_var(utf8_encode($request->getAttribute('valor')), FILTER_SANITIZE_STRING);
                
                $sql = "SELECT * FROM alumnos WHERE ".$parametro." = :valor";

                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
                    $stmt->bindParam(':valor', $valor);
                    $stmt->execute();
    
                    if($stmt->rowCount() > 0){
                        $alumnos = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
                        $json = json_encode($alumnos);
                        $response->withHeader('Content-Type', 'application/json');
                        $response->getBody()->write($json);
                        return $response;
                    }else{
                        //$payload = '{"respuesta":"no hay datos"}';
                        $response->withHeader('Content-Type', 'application/json');
                        $response->getBody()->write('{"respuesta":"no hay datos"}');
                        return $response;
                    }
                } catch (PDOException $e) {
                    $response->withHeader('Content-Type', 'application/json');
                    //$payload = '{"error":{"text":'.$e->getMessage().'}}';
                    $response->getBody()->write('{"error":{"text":'.$e->getMessage().'}}');
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
                    $response->getBody()->write('{"respuesta":"nuevo alumno guardado"}');
                    return $response;
                } catch (PDOException $e) {
                    $response->withHeader('Content-Type', 'application/json');
                    //$payload = '{"error":{"text":'.$e->getMessage().'}}';
                    $response->getBody()->write('{"error":{"text":'.$e->getMessage().'}}');
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
                    $response->getBody()->write('{"respuesta":"datos de alumno modificados"}');
                    return $response;
                } catch (PDOException $e) {
                    $response->withHeader('Content-Type', 'application/json');
                    //$payload = '{"error":{"text":'.$e->getMessage().'}}';
                    $response->getBody()->write('{"error":{"text":'.$e->getMessage().'}}');
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
            $group->get('', function (Request $request, Response $response, $args){
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
                $id_registro = filter_var($request->getAttribute('id'), FILTER_SANITIZE_STRING);

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
        $group->group('/laboratorios', function (RouteCollectorProxy $group){
            $group->get('', function (Request $request, Response $response, $args){
                $sql = "SELECT * FROM laboratorios";

                try {
                    $db = new db();
                    $db = $db->conexionDB();

                    $stmt = $db->prepare($sql);
                    $stmt->execute();

                    if($stmt->rowCount() > 0){
                        $laboratorios = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $json = json_encode($laboratorios);

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
            $group->get('/{parametro}/{valor}', function (Request $request, Response $response, $args){
                $parametro = filter_var($request->getAttribute('parametro'), FILTER_SANITIZE_STRING);
                $valor = filter_var(utf8_encode($request->getAttribute('valor')), FILTER_SANITIZE_STRING);

                $sql = "SELECT * FROM laboratorios WHERE ".$parametro." = :valor";

                try {
                    $db = new db();
                    $db = $db->conexionDB();

                    $stmt = $db->prepare($sql);
                    $stmt->bindParam(':valor', $valor);
                    $stmt->execute();

                    if($stmt->rowCount() > 0){
                        $laboratorios = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $json = json_encode($laboratorios);
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
                $datos = json_decode(file_get_contents('php://input'), true);
                $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
                $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
                $hora_entrada = filter_var($datos['hora_entrada'], FILTER_SANITIZE_STRING);
                $hora_salida = filter_var($datos['hora_salida'], FILTER_SANITIZE_STRING);
                $encargado = filter_var($datos['encargado'], FILTER_SANITIZE_STRING);

                $sql = "INSERT INTO laboratorios (nombre, carrera, hora_entrada, hora_salida, encargado) VALUES
                        (:nombre,
                        :carrera,
                        :hora_entrada,
                        :hora_salida,
                        :encargado)";

                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
    
                    $stmt->bindParam(':nombre', $nombre);
                    $stmt->bindParam(':carrera', $carrera);
                    $stmt->bindParam(':hora_entrada', $hora_entrada);
                    $stmt->bindParam(':hora_salida', $hora_salida);
                    $stmt->bindParam(':encargado', $encargado);
    
                    $stmt->execute();
    
                    $response->withHeader('Content-Type', 'application/json');
                    $payload = '{"respuesta":"nuevo laboratorio guardado"}';
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
                $id_laboratorio = filter_var($datos['id'], FILTER_SANITIZE_STRING);
                $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
                $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
                $hora_entrada = filter_var($datos['hora_entrada'], FILTER_SANITIZE_STRING);
                $hora_salida = filter_var($datos['hora_salida'], FILTER_SANITIZE_STRING);
                $encargado = filter_var($datos['encargado'], FILTER_SANITIZE_STRING);
    
                $sql = "UPDATE laboratorios SET 
                        nombre = :nombre, 
                        carrera = :carrera, 
                        hora_entrada = :hora_entrada,
                        hora_salida = :hora_salida,
                        encargado = :encargado
                        WHERE id_laboratorio = :id";
                
                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
    
                    $stmt->bindParam(':nombre', $nombre);
                    $stmt->bindParam(':carrera', $carrera);
                    $stmt->bindParam(':hora_entrada', $hora_entrada);
                    $stmt->bindParam(':hora_salida', $hora_salida);
                    $stmt->bindParam(':encargado', $encargado);
                    $stmt->bindParam(':id', $id_laboratorio);
    
                    $stmt->execute();
    
                    $response->withHeader('Content-Type', 'application/json');
                    $response->getBody()->write('{"respuesta":"datos de laboratorio modificados"}');
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
                $id_laboratorio = filter_var($datos['id'], FILTER_SANITIZE_STRING);
    
                $sql = "DELETE FROM laboratorios WHERE id_laboratorio = :id";
                
                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
    
                    $stmt->bindParam(':id', $id_laboratorio);
    
                    $stmt->execute();
    
                    $response->withHeader('Content-Type', 'application/json');
                    $response->getBody()->write('{"respuesta":"datos de laboratorio borrados"}');
                    return $response;
                } catch (PDOException $e) {
                    $response->withHeader('Content-Type', 'application/json');
                    //$payload = '{"error":{"text":'.$e->getMessage().'}}';
                    $response->getBody()->write('{"error":{"text":'.$e->getMessage().'}}');
                    return $response;
                }
            });
        });
        $group->group('/maestros', function (RouteCollectorProxy $group){
            $group->get('', function (Request $request, Response $response, $args){
                $sql = "SELECT * FROM maestros";

                try {
                    $db = new db();
                    $db = $db->conexionDB();

                    $stmt = $db->prepare($sql);
                    $stmt->execute();

                    if($stmt->rowCount() > 0){
                        $laboratorios = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $json = json_encode($laboratorios);

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
            $group->get('/{parametro}/{valor}', function (Request $request, Response $response, $args){
                $parametro = filter_var($request->getAttribute('parametro'), FILTER_SANITIZE_STRING);
                $valor = filter_var(utf8_encode($request->getAttribute('valor')), FILTER_SANITIZE_STRING);

                $sql = "SELECT * FROM maestros WHERE ".$parametro." = :valor";

                try {
                    $db = new db();
                    $db = $db->conexionDB();

                    $stmt = $db->prepare($sql);
                    $stmt->bindParam(':valor', $valor);
                    $stmt->execute();

                    if($stmt->rowCount() > 0){
                        $laboratorios = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $json = json_encode($laboratorios);
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
                $datos = json_decode(file_get_contents('php://input'), true);
                $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
                $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
                $clave = filter_var($datos['clave'], FILTER_SANITIZE_STRING);

                $sql = "INSERT INTO maestros (nombre, carrera, clave) VALUES
                        (:nombre,
                        :carrera,
                        :clave)";

                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
    
                    $stmt->bindParam(':nombre', $nombre);
                    $stmt->bindParam(':carrera', $carrera);
                    $stmt->bindParam(':clave', $clave);
    
                    $stmt->execute();
    
                    $response->withHeader('Content-Type', 'application/json');
                    $payload = '{"respuesta":"nuevo maestro guardado"}';
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
                $id_maestro = filter_var($datos['id'], FILTER_SANITIZE_STRING);
                $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
                $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
                $clave = filter_var($datos['clave'], FILTER_SANITIZE_STRING);
    
                $sql = "UPDATE maestros SET 
                        nombre = :nombre, 
                        carrera = :carrera, 
                        clave = :clave
                        WHERE id_maestro = :id";
                
                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
    
                    $stmt->bindParam(':nombre', $nombre);
                    $stmt->bindParam(':carrera', $carrera);
                    $stmt->bindParam(':clave', $clave);
                    $stmt->bindParam(':id', $id_maestro);
    
                    $stmt->execute();
    
                    $response->withHeader('Content-Type', 'application/json');
                    $response->getBody()->write('{"respuesta":"datos de maestro modificados"}');
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
                $id_maestro = filter_var($datos['id'], FILTER_SANITIZE_STRING);
    
                $sql = "DELETE FROM maestros WHERE id_maestro = :id";
                
                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
    
                    $stmt->bindParam(':id', $id_maestro);
    
                    $stmt->execute();
    
                    $response->withHeader('Content-Type', 'application/json');
                    $response->getBody()->write('{"respuesta":"datos de maestro borrados"}');
                    return $response;
                } catch (PDOException $e) {
                    $response->withHeader('Content-Type', 'application/json');
                    //$payload = '{"error":{"text":'.$e->getMessage().'}}';
                    $response->getBody()->write('{"error":{"text":'.$e->getMessage().'}}');
                    return $response;
                }
            });
        });
        $group->group('/practicas', function (RouteCollectorProxy $group){
            $group->get('', function (Request $request, Response $response, $args){
                $sql = "SELECT * FROM practicas";

                try {
                    $db = new db();
                    $db = $db->conexionDB();

                    $stmt = $db->prepare($sql);
                    $stmt->execute();

                    if($stmt->rowCount() > 0){
                        $laboratorios = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $json = json_encode($laboratorios);

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
            $group->get('/{parametro}/{valor}', function (Request $request, Response $response, $args){
                $parametro = filter_var($request->getAttribute('parametro'), FILTER_SANITIZE_STRING);
                $valor = filter_var(utf8_encode($request->getAttribute('valor')), FILTER_SANITIZE_STRING);

                $sql = "SELECT * FROM practicas WHERE ".$parametro." = :valor";


                try {
                    $db = new db();
                    $db = $db->conexionDB();

                    $stmt = $db->prepare($sql);
                    $stmt->bindParam(':valor', $valor);
                    $stmt->execute();

                    if($stmt->rowCount() > 0){
                        $laboratorios = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $json = json_encode($laboratorios);
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
                $datos = json_decode(file_get_contents('php://input'), true);
                $maestro = filter_var($datos['maestro'], FILTER_SANITIZE_STRING);
                $materia = filter_var($datos['materia'], FILTER_SANITIZE_STRING);
                // $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
                // $semestre = filter_var($datos['semestre'], FILTER_SANITIZE_STRING);
                // $grupo = filter_var($datos['grupo'], FILTER_SANITIZE_STRING);
                // $turno = filter_var($datos['turno'], FILTER_SANITIZE_STRING);
                // $laboratorio = filter_var($datos['laboratorio'], FILTER_SANITIZE_STRING);
                // $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
                // $numero = filter_var($datos['numero'], FILTER_SANITIZE_STRING);
                // $descripcion = filter_var($datos['descripcion'], FILTER_SANITIZE_STRING);
                // $materiales = filter_var($datos['materiales'], FILTER_SANITIZE_STRING);
                // $equipo = filter_var($datos['equipo'], FILTER_SANITIZE_STRING);
                // $reprogramaciones = filter_var($datos['reprogramaciones'], FILTER_SANITIZE_STRING);
                // $justificacion = filter_var($datos['justificacion'], FILTER_SANITIZE_STRING);
                // $especificacion = filter_var($datos['especificacion'], FILTER_SANITIZE_STRING);
                // $fecha_termino = filter_var($datos['fecha_termino'], FILTER_SANITIZE_STRING);
                // $realizada = filter_var($datos['realizada'], FILTER_SANITIZE_STRING);
                // $eficiencia = filter_var($datos['eficiencia'], FILTER_SANITIZE_STRING);
                // $confirma = filter_var($datos['confirma'], FILTER_SANITIZE_STRING);
                // $observaciones = filter_var($datos['observaciones'], FILTER_SANITIZE_STRING);
                // $fallas = filter_var($datos['fallas'], FILTER_SANITIZE_STRING);
                // $observaciones_prof = filter_var($datos['observaciones_prof'], FILTER_SANITIZE_STRING);
                // $seguimiento = filter_var($datos['seguimiento'], FILTER_SANITIZE_STRING);

                $sql = "INSERT INTO practicas (
                            maestro, 
                            materia
                            -- carrera,
                            -- semestre,
                            -- grupo,
                            -- turno,
                            -- laboratorio,
                            -- nombre,
                            -- numero,
                            -- descripcion,
                            -- materiales,
                            -- equipo,
                            -- reprogramaciones,
                            -- justificacion,
                            -- especificacion,
                            -- fecha_termino,
                            -- realizada,
                            -- eficiencia,
                            -- confirma,
                            -- observaciones,
                            -- fallas,
                            -- observaciones_prof,
                            -- seguimiento
                        ) VALUES (
                            :maestro,
                            :materia
                            -- :carrera,
                            -- :semestre,
                            -- :grupo,
                            -- :turno,
                            -- :laboratorio,
                            -- :nombre,
                            -- :numero,
                            -- :descripcion,
                            -- :materiales,
                            -- :equipo,
                            -- :reprogramaciones,
                            -- :justificacion,
                            -- :especificacion,
                            -- :fecha_termino,
                            -- :realizada,
                            -- :eficiencia,
                            -- :confirma,
                            -- :observaciones,
                            -- :fallas,
                            -- :observaciones_prof,
                            -- :seguimiento
                        )";

                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
    
                    $stmt->bindParam(':maestro', $maestro);
                    $stmt->bindParam(':materia', $materia);
                    // $stmt->bindParam(':carrera', $carrera);
                    // $stmt->bindParam(':semestre', $semestre);
                    // $stmt->bindParam(':grupo', $grupo);
                    // $stmt->bindParam(':turno', $turno);
                    // $stmt->bindParam(':laboratorio', $laboratorio);
                    // $stmt->bindParam(':nombre', $nombre);
                    // $stmt->bindParam(':numero', $numero);
                    // $stmt->bindParam(':descripcion', $descripcion);
                    // $stmt->bindParam(':materiales', $materiales);
                    // $stmt->bindParam(':equipo', $equipo);
                    // $stmt->bindParam(':reprogramaciones', $reprogramaciones);
                    // $stmt->bindParam(':justificacion', $justificacion);
                    // $stmt->bindParam(':especificacion', $especificacion);
                    // $stmt->bindParam(':fecha_termino', $fecha_termino);
                    // $stmt->bindParam(':realizada', $realizada);
                    // $stmt->bindParam(':eficiencia', $eficiencia);
                    // $stmt->bindParam(':confirma', $confirma);
                    // $stmt->bindParam(':observaciones', $observaciones);
                    // $stmt->bindParam(':fallas', $fallas);
                    // $stmt->bindParam(':observaciones_prof', $observaciones_prof);
                    // $stmt->bindParam(':seguimiento', $seguimiento);
    
                    $stmt->execute();
    
                    $response->withHeader('Content-Type', 'application/json');
                    $payload = '{"respuesta":"nueva práctica guardada"}';
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
                $id_practica = filter_var($datos['id'], FILTER_SANITIZE_STRING);
                // $maestro = filter_var($datos['maestro'], FILTER_SANITIZE_STRING);
                $materia = filter_var($datos['materia'], FILTER_SANITIZE_STRING);
                $carrera = filter_var($datos['carrera'], FILTER_SANITIZE_STRING);
                $semestre = filter_var($datos['semestre'], FILTER_SANITIZE_STRING);
                $grupo = filter_var($datos['grupo'], FILTER_SANITIZE_STRING);
                $turno = filter_var($datos['turno'], FILTER_SANITIZE_STRING);
                $laboratorio = filter_var($datos['laboratorio'], FILTER_SANITIZE_STRING);
                $nombre = filter_var($datos['nombre'], FILTER_SANITIZE_STRING);
                $numero = filter_var($datos['numero'], FILTER_SANITIZE_STRING);
                $descripcion = filter_var($datos['descripcion'], FILTER_SANITIZE_STRING);
                $materiales = filter_var($datos['materiales'], FILTER_SANITIZE_STRING);
                $equipo = filter_var($datos['equipo'], FILTER_SANITIZE_STRING);
                // $reprogramaciones = filter_var($datos['reprogramaciones'], FILTER_SANITIZE_STRING);
                // $justificacion = filter_var($datos['justificacion'], FILTER_SANITIZE_STRING);
                // $especificacion = filter_var($datos['especificacion'], FILTER_SANITIZE_STRING);
                // $fecha_termino = filter_var($datos['fecha_termino'], FILTER_SANITIZE_STRING);
                // $realizada = filter_var($datos['realizada'], FILTER_SANITIZE_STRING);
                // $eficiencia = filter_var($datos['eficiencia'], FILTER_SANITIZE_STRING);
                // $confirma = filter_var($datos['confirma'], FILTER_SANITIZE_STRING);
                // $observaciones = filter_var($datos['observaciones'], FILTER_SANITIZE_STRING);
                // $fallas = filter_var($datos['fallas'], FILTER_SANITIZE_STRING);
                // $observaciones_prof = filter_var($datos['observaciones_prof'], FILTER_SANITIZE_STRING);
                // $seguimiento = filter_var($datos['seguimiento'], FILTER_SANITIZE_STRING);

    
                $sql = "UPDATE practicas SET 
                            -- maestro, 
                            materia
                            carrera,
                            semestre,
                            grupo,
                            turno,
                            laboratorio,
                            nombre,
                            numero,
                            descripcion,
                            materiales,
                            equipo,
                            -- reprogramaciones,
                            -- justificacion,
                            -- especificacion,
                            -- fecha_termino,
                            -- realizada,
                            -- eficiencia,
                            -- confirma,
                            -- observaciones,
                            -- fallas,
                            -- observaciones_prof,
                            -- seguimiento
                        WHERE id_maestro = :id";
                
                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
    
                    $stmt->bindParam(':materia', $materia);
                    $stmt->bindParam(':carrera', $carrera);
                    $stmt->bindParam(':semestre', $semestre);
                    $stmt->bindParam(':grupo', $grupo);
                    $stmt->bindParam(':turno', $turno);
                    $stmt->bindParam(':laboratorio', $laboratorio);
                    $stmt->bindParam(':nombre', $nombre);
                    $stmt->bindParam(':numero', $numero);
                    $stmt->bindParam(':descripcion', $descripcion);
                    $stmt->bindParam(':materiales', $materiales);
                    $stmt->bindParam(':equipo', $equipo);
                    $stmt->bindParam(':id', $id_practica);
    
                    $stmt->execute();
    
                    $response->withHeader('Content-Type', 'application/json');
                    $response->getBody()->write('{"respuesta":"datos de práctica modificados"}');
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
                $id_practica = filter_var($datos['id'], FILTER_SANITIZE_STRING);
    
                $sql = "DELETE FROM practicas WHERE id_practica = :id";
                
                try {
                    $db = new db();
                    $db = $db->conexionDB();
    
                    $stmt = $db->prepare($sql);
    
                    $stmt->bindParam(':id', $id_practica);
    
                    $stmt->execute();
    
                    $response->withHeader('Content-Type', 'application/json');
                    $response->getBody()->write('{"respuesta":"datos de práctica borrados"}');
                    return $response;
                } catch (PDOException $e) {
                    $response->withHeader('Content-Type', 'application/json');
                    //$payload = '{"error":{"text":'.$e->getMessage().'}}';
                    $response->getBody()->write('{"error":{"text":'.$e->getMessage().'}}');
                    return $response;
                }
            });
        });
    });
});


$app->run();