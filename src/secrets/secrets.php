<?php
use Firebase\JWT\JWT;

class auth{
    private static $secret_key = "hoy21no";
    private static $encrypt = ['HS256'];

    public static function generarJWT(){
        $tiempo = time();

        $token = array(
            'exp' => $tiempo + 60,
            'data' => "hola"
        );

        return JWT::encode($token, self::$secret_key);
    }
}