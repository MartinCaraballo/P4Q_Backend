<?php

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\ORMSetup;
use Doctrine\DBAL\DriverManager;

return function () {
    $paths = [__DIR__ . '/../src/Domain'];
    $isDevMode = true;

    $dbParams = [
        'driver' => 'pdo_pgsql',
        'host' => 'localhost',
        'port' => 5432,
        'dbname' => 'postgres',
        'user' => 'postgres',
        'password' => 'postgres',
        'charset' => 'utf-8'
    ];

    //$config = ORMSetup::createAnnotationMetadataConfiguration($paths, $isDevMode);
    $config = ORMSetup::createAttributeMetadataConfiguration($paths, $isDevMode);
    $connection = DriverManager::getConnection($dbParams, $config);

    //return EntityManager::create($connection, $config);
    return new EntityManager($connection, $config);
};