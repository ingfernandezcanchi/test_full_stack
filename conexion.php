<?php
class Conexion{
    public static function Conectar(){
        define('servidor','localhost');
        define('nombre_bd', 'test_full_stack');
        define('usuario','root');
        define('password','');
        $opciones = array(PDO::MYSQL_ATTR_INIT_COMMAND => 'set names utf8mb4');
        try{
            $conexion = new PDO("mysql:host=".servidor."; dbname=".nombre_bd, usuario, password, $opciones);
            return $conexion;
        }catch (Exception $e){
            die("El error de Conexion es: ". $e->getMessage());
        }
    }
}