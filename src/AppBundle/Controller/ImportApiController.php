<?php

namespace AppBundle\Controller;

use DateTime;
use Pimcore;
use Pimcore\Bundle\AdminBundle\Controller\Rest\AbstractRestController;
use Pimcore\Model\DataObject;
use Pimcore\Model\Assets;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\component\HttpFoundation\JsonResponse;
use Pimcore\Console\AbstractCommand;
use Pimcore\Console\Dumper;
use Pimcore\Model\Asset\MetaData\ClassDefinition\Data\Asset;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Pimcore\Model\Element\ValidationException;

/**
 * Class ImportApiController
 * @package AppBundle\Controller
 */
 
 
class ImportApiController extends AbstractRestController
{
   
  
  
   

    /**
     * @Route("/webservice/addCategory", methods={"PUT"})
     */
     
    public function addCategory(Request $request)
    {

       
        $data = json_decode($request->getContent(), true);
        dump($data);

    
        foreach($data as $Cat)
        {
            $Category = new \Pimcore\Model\DataObject\Category();
             
            $CatKey=$Cat["Key"];
           // dump($CatKey);
            $CatName= $Cat["Name"];
            $CatDescription =$Cat["Description"];
            $CatActive =$Cat["Active"];
            $CatImage =$Cat["Image"];
            
            $image_path = "/image/".$CatImage;
            $image = \Pimcore\Model\Asset::getByPath($image_path);
           
           
           // dump($image_path);
            dump($image);

            $Category->setKey($CatKey);
            $Category->setParentId(3);
            $Category->setName($CatName);
            $Category->setDescription($CatDescription);
            $Category->setActive($CatActive);
            $Category->setPublished(true);
            $Category->setImage($image);
            $Category->save();
        }

       
      
        return $this->adminJson(["success" => true]);
      
    }
    
    
    
    
      /**
     * @Route("/webservice/addBrand", methods={"PUT"})
     */
     
    public function addBrand(Request $request)
    {

       
        $data = json_decode($request->getContent(), true);
        dump($data);

    
        foreach($data as $Br)
        {
            $Brand = new \Pimcore\Model\DataObject\Brand();
             
            $BrandKey=$Br["Key"];
            $BrandName= $Br["Name"];
          
          
          
            $Brand->setKey($BrandKey);
            dump($BrandKey);
            $Brand->setParentId(10);
            $Brand->setName($BrandName);
            $Brand->setPublished(true);
            $Brand->save();
        }

       
      
        return $this->adminJson(["success" => true]);
      
    }
    
    
    
    
    
      /**
     * @Route("/webservice/addProduct", methods={"PUT"})
     */
     
    public function addProduct(Request $request)
    {

       
        $data = json_decode($request->getContent(), true);
        

    
        foreach($data as $Pro)
        {
            $object = new \Pimcore\Model\DataObject\Product();
            
           //give value for setters  
           
           $pkey= $Pro["Key"];
           $pname= $Pro["name"];
           $pmodelNo= $Pro["modelNo"];
           $pqunatityInStock = $Pro["qunatityInStock"];
           $pdescription = $Pro["description"];
           $pratings = $Pro["ratings"];
           $pbrand = $Pro["brand"];
           $pcolor = $Pro["color"];
           
           $pweightunit = $Pro["weightunit"];
           $pweight = $Pro["weight"];
           $pvoltageunit = $Pro["voltageunit"];
           $pvoltage = $Pro["voltage"];
           $pwattageunit = $Pro["wattageunit"];
           $pwattage = $Pro["wattage"];
           $pprice = $Pro["price"];
           $plaunchDate = $Pro["launchDate"];
           $pcategory = $Pro["category"];
           $pspecialfeatures = $Pro["specialfeatures"];
           $pinstallationType = $Pro["installationType"];
           $pcapacity = $Pro["capacity"];
           $pblades = $Pro["blades"];
           $pspeed = $Pro["speed"];
           $pdoorStyle = $Pro["doorstyle"];
           
          
       try {
             
             // conditions for try block 
             
             $msg1 = "import failed  ";
             if(($pkey)== NULL )
                    {
                     $msg ="key  is given NULL ";
                     dump($msg1.$msg);
                     throw new ValidationException($msg);
                    }
                    elseif(($pname)== NULL )
                    {
                     $msg =" Name is given NULL";
                     dump($msg1.$msg);
                     throw new ValidationException($msg);
                    }
                    elseif(($pprice)== NULL )
                    {
                     $msg ="price is given NULL";
                     dump($msg1.$msg);
                     throw new ValidationException($msg);
                    }
                    elseif(($pmodelNo)== NULL )
                    {
                     $msg ="modelNo is given NULL";
                     dump($msg1.$msg);
                     throw new ValidationException($msg);
                    }
                    elseif(($pdescription)== NULL )
                    {
                     $msg ="description is given NULL";
                     dump($msg1.$msg);
                     throw new ValidationException($msg);
                    }
                    elseif(($pqunatityInStock)== NULL )
                    {
                     $msg ="quantityInStock is given NULL";
                     dump($msg1.$msg);
                     throw new ValidationException($msg);
                    }
                    elseif(($pvoltage)== NULL )
                    {
                     $msg ="Voltage is given NULL.\n";
                     dump('Issue in import ');
                     throw new ValidationException($msg);
                    }
                    elseif(($pwattage)== NULL )
                    {
                        $msg ="Wattage is given NULL";
                        dump($msg1.$msg);
                        throw new ValidationException($msg);
                    }
                    elseif(($pweight)== NULL )
                    {
                     $msg ="WEight is given NULL";
                     dump($msg1.$msg);
                     throw new ValidationException($msg);
                    }
                    elseif($pcolor == NULL)
                    {
                     $msg ="color is given NULL";
                     dump($msg1.$msg);
                     throw new ValidationException($msg);
                    }
                    elseif(($pspecialfeatures == NULL))
                    {
                     $msg ="specific features is given NULL";
                     dump($msg1.$msg);
                     throw new ValidationException($msg);
                    }
                    
                    else 
                    
                    { //saving objects
                    
                    
                    
            //dump($pkey);
            $object->setKey($pkey);
            $object->setParentId(4);
            $object->setPublished(true);
            
     
           
         
             $object->setName($pname);
             $object->setModelNo($pmodelNo);
             $object->setDescription($pdescription);
             $object->setQuantityInStock($pqunatityInStock);
             $object->setRatings($pratings);
             $object->setBrand($pbrand);
            
            
            //for color
             $t = new \Pimcore\Model\DataObject\Data\RgbaColor();
             $t->setRgba($pcolor);
             $object->setColour($t);
           
           
             //for quantity value
           
             $weightunit = DataObject\QuantityValue\Unit::getByAbbreviation($pweightunit);
          
             $object->setWeight(new DataObject\Data\QuantityValue($pweight, $weightunit->getId()));
             $voltageunit = DataObject\QuantityValue\Unit::getByAbbreviation($pvoltageunit);
             $object->setVoltage(new DataObject\Data\QuantityValue($pvoltage, $voltageunit->getId()));
             $wattageunit = DataObject\QuantityValue\Unit::getByAbbreviation($pwattageunit);
             $object->setWattage(new DataObject\Data\QuantityValue($pwattage, $wattageunit->getId()));
             $unit = DataObject\QuantityValue\Unit::getByAbbreviation('Rs');
             
             $object->setPrice(new DataObject\Data\QuantityValue($pprice, $unit->getId()));
              
              
             //for image
             $ProductImage = $Pro["image"];
            
             $image_path = "/image/".$ProductImage;
             $image = \Pimcore\Model\Asset::getByPath($image_path);
             $object->setImage($image);
             
             
             
             //for object brick
             
           dump($pspecialfeatures); 
           if($pspecialfeatures == 'AcFeatures'){
                    
                    $extraFeatures = new Dataobject\Objectbrick\Data\AcFeatures($object);
                    $object->getSpecificFeatures()->setAcFeatures($extraFeatures);
                    $extraFeatures->setInstallationType($pinstallationType);
                    dump($pinstallationType);
                   // $ACunit = DataObject\QuantityValue\Unit::getByAbbreviation('ton');
                     $unit = DataObject\QuantityValue\Unit::getByAbbreviation('Tonn');
                    // dump($unit);
                    $extraFeatures->setCapacity(new DataObject\Data\QuantityValue($pcapacity, $unit->getId()));
                    
                    }

            if($pspecialfeatures == 'FanFeatures'){
                        $extraFeatures = new Dataobject\Objectbrick\Data\FanFeatures($object);
                        $object->getSpecificFeatures()->setFanFeatures($extraFeatures);
                        $extraFeatures->setblades($pblades);
                        $units = DataObject\QuantityValue\Unit::getByAbbreviation('Rpm');
                        $extraFeatures->setSpeed(new DataObject\Data\QuantityValue($pspeed, $units->getId()));
                    
                    }
                    
                    
                    
            if($pspecialfeatures == 'GeyserFeatures'){
                        $extraFeatures = new Dataobject\Objectbrick\Data\GeyserFeatures($object);
                        $object->getSpecificFeatures()->setGeyserFeatures($extraFeatures);
                        $units = DataObject\QuantityValue\Unit::getByAbbreviation('Kg'); 
                        $extraFeatures->setCapacity(new DataObject\Data\QuantityValue($pcapacity, $units->getId()));
                    
                    }        
                       
            if($pspecialfeatures == 'RefrigeratorFeatures'){
                        
                        $extraFeatures = new Dataobject\Objectbrick\Data\RefrigeratorFeatures($object);
                        $object->getSpecificFeatures()->setRefrigeratorFeatures($extraFeatures);
                        dump($pdoorStyle);
                     
                        
                        $extraFeatures->setDoorStyle($pdoorStyle);
                        $units = DataObject\QuantityValue\Unit::getByAbbreviation('Kg'); 
                        $extraFeatures->setCapacity(new DataObject\Data\QuantityValue($pcapacity, $units->getId()));
                    
                    }           
             
                    
          //for date
          $launchDate = \Carbon\Carbon::parse($plaunchDate);
          $object->setLaunchDate($launchDate);    
          
          
          
          //relation
          $category = new \Pimcore\Model\DataObject\Category\Listing();
                        $category->setCondition('name = ?', $pcategory);
                        $category->setLimit(1);
                        foreach ($category as $cat) {
                            //p_r($cat2);die;
                            $object->setCategory($cat);
                        }   
                        
                        
                        
                        
                    
           
            
           $object->save();
           dump("Data Imported Successfully.\n");
           //log file  for sucessful import
                    $msg ="Data Imported Successfully.\n";
                   
                    $logMsg=new \Pimcore\Model\DataObject\Log();        
                    $logMsg->setKey($pkey);
                    $logMsg->setPublished(true);
                    $logMsg->setParentId(30);
                    $logMsg->setMessage($msg);
                    $logMsg->save();  
                    
          
           }
           //end of else 
           
           
           }
           
          //end of try block
          
          
          //starting of catch block
          
          
          catch (ValidationException $e)
                {  
                
                
                 
                    
          //log file for exception raised         
                    dump('import blocked  '.$e->getMessage());
                    $msg_err = "import failed ";
                    $logMsg=new \Pimcore\Model\DataObject\Log();        
                    $logMsg->setKey($pkey);
                    $logMsg->setPublished(true);
                    $logMsg->setParentId(30);
                    $logMsg->setMessage($msg_err.$e->getMessage());
                    $logMsg->save();
                    continue;
                }
           
           
         
                    
            
      }

       //for mail          
                    $mail = new \Pimcore\Mail();
                    // $mail->addTo('vashusharma1104@gmail.com');
                    // $mail->setSubject('New Arrival');
                   $mail->setDocument('/importEmail');
                    // // $mail->setParams($params);
                  $mail->send();  
      
        return $this->adminJson(["success" => true]);
      
    }
    
    
    

}