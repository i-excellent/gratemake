<?php
namespace app\components;
/**
 * Created by PhpStorm.
 * User: zond
 * Date: 08.07.2016
 * Time: 15:13
 */
use yii;
trait MainTrait{

    static public function getTranslit($string)
    {
        $charlist = array(
            "А"=>"A","Б"=>"B","В"=>"V","Г"=>"G",
            "Д"=>"D","Е"=>"E","Ж"=>"J","З"=>"Z","И"=>"I",
            "Й"=>"Y","К"=>"K","Л"=>"L","М"=>"M","Н"=>"N",
            "О"=>"O","П"=>"P","Р"=>"R","С"=>"S","Т"=>"T",
            "У"=>"U","Ф"=>"F","Х"=>"H","Ц"=>"TS","Ч"=>"CH",
            "Ш"=>"SH","Щ"=>"SCH","Ъ"=>"","Ы"=>"YI","Ь"=>"",
            "Э"=>"E","Ю"=>"YU","Я"=>"YA","а"=>"a","б"=>"b",
            "в"=>"v","г"=>"g","д"=>"d","е"=>"e","ж"=>"j",
            "з"=>"z","и"=>"i","й"=>"y","к"=>"k","л"=>"l",
            "м"=>"m","н"=>"n","о"=>"o","п"=>"p","р"=>"r",
            "с"=>"s","т"=>"t","у"=>"u","ф"=>"f","х"=>"h",
            "ц"=>"ts","ч"=>"ch","ш"=>"sh","щ"=>"sch","ъ"=>"y",
            "ы"=>"yi","ь"=>"","э"=>"e","ю"=>"yu","я"=>"ya"
        );
        return strtr($string,$charlist);
        }
        static public function getSubject($id){
        $db = Yii::$app->db;
        $aSubject = $db->createCommand("SELECT id,name FROM subject WHERE id_menu = :id")
            ->bindValue(':id',$id)
            ->queryAll();
        return $aSubject;
    }
    static public function getMenu(){
        $db = Yii::$app->db;
        $aMenu = $db->createCommand("SELECT id,name FROM menu")
            ->queryAll();
        return $aMenu;
    }
    static public function getDropList($array){
 $newArray=[];
       foreach ($array as $row){
           $newArray[$row['id']]=$row['name'];  //все гениальное - просто.1 строчка - 2 часа))
       }
        return $newArray;
    }

}