<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitf1bc0106597cc187b16d06d09979372b
{
    public static $prefixLengthsPsr4 = array (
        'U' => 
        array (
            'Util\\' => 5,
        ),
        'M' => 
        array (
            'Model\\' => 6,
        ),
        'L' => 
        array (
            'League\\Plates\\' => 14,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Util\\' => 
        array (
            0 => __DIR__ . '/../..' . '/Util',
        ),
        'Model\\' => 
        array (
            0 => __DIR__ . '/../..' . '/Model',
        ),
        'League\\Plates\\' => 
        array (
            0 => __DIR__ . '/..' . '/league/plates/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitf1bc0106597cc187b16d06d09979372b::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitf1bc0106597cc187b16d06d09979372b::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitf1bc0106597cc187b16d06d09979372b::$classMap;

        }, null, ClassLoader::class);
    }
}
