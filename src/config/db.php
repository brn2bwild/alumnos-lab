<?php
    class db{
        private $dbHost = 'localhost';
        private $dbUser = 'root';
        private $dbPass = '';
        private $dbName = 'practicas';

        public function conexionDB(){
            $mysqlConnect = "mysql:host=$this->dbHost;dbname=$this->dbName;charset=utf8";
            $dbConexion = new PDO($mysqlConnect, $this->dbUser, $this->dbPass);
            $dbConexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $dbConexion;
        }
    }