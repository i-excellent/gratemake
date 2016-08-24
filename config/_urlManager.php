<?php
return [
    'enablePrettyUrl' => true,
    'showScriptName' => false,
        'rules'=>[
            'work/present/<id:[\w\=\-]+>' => 'work/present',
    ]
];