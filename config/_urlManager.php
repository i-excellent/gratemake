<?php
return [
    'enablePrettyUrl' => true,
    'showScriptName' => false,
        'rules'=>[
            'work/present/<id:[\w\=\-]+>' => 'work/present',
            'work/index/<url_menu:[\w\=\-]+>/<url_subject:[\w\=\-]+>' => 'work/index',
            'work/index/<url_menu:[\w\=\-]+>' => 'work/index',
    ]
];