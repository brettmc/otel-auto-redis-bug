<?php
use function OpenTelemetry\Instrumentation\hook;

hook(
    Redis::class,
    'rawCommand',
    static function (
        Redis $redis,
        array $params,
        string $class,
        string $function,
        ?string $filename,
        ?int $lineno
    ) {
        var_dump('redis:pre');
    },
    static function ()
    {
        var_dump('redis:post');
    }
);

//Connecting to Redis server on localhost
$redis = new Redis();
$redis->connect('redis', 6379);
echo "Connection to server sucessfully";
//check whether server is running or not
echo "Server is running: ".$redis->ping();

$redis->rawCommand('set', 'mystring', 'myvalue');
