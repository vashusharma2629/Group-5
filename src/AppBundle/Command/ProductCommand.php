<?php

namespace AppBundle\Command;

use Pimcore;
use Pimcore\Console\AbstractCommand;
use Pimcore\Console\Dumper;
use Pimcore\Model\Asset\MetaData\ClassDefinition\Data\Asset;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Pimcore\Model\DataObject;
use Pimcore\Model\DataObject\Import;
use Pimcore\Model\DataObject\Category;
use Pimcore\Model\DataObject\Log;



class ProductCommand extends AbstractCommand
{
    protected function configure()
    {
        $this
            ->setName('Pimcore:CsvCommand:Product')
            ->setDescription('imports csv files'); 
    }

    /**
     * @param InputInterface $input
     * @param OutputInterface $output
     * @return int|null|void
     * @throws \Exception
     */

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $object = new \Pimcore\Model\DataObject\Import\Listing();
        $object->setCondition('name = ?', 'Product');
        // $object->addConditionParam('status = ?', false);
        $object->setLimit(1);

        foreach ($object as $path) {
            $file = $path->getFile();
            $file = (PIMCORE_PROJECT_ROOT . '/web/var/assets' . $file->getPath() . $file->getFilename());
            // p_r($file);
            // die;
        }
        $h = fopen($file, "r");
        if ($h !== FALSE) {
            while (!feof($h)) {

                $cid[] = fgetcsv($h);
                $num = count($cid);
            }
            foreach ($cid[0] as $single_csv) {
                $cidName[] = $single_csv;
            }
            foreach ($cid as $val => $csv) {
                if ($val == FALSE) {
                    continue;
                }
                foreach ($cidName as $cidKey => $colName) {
                    $datas[$val - 1][$colName] = $csv[$cidKey];
                }
            }
            $count = 1;
            $json = json_encode($datas);
            fclose($h);
        }
        $data = json_decode($json);
        foreach ($data as $prod) {
       

                if ($prod->key != NULL) {
                   
                    $object = new Pimcore\Model\DataObject\Product();
                    $object->setKey($prod->key);
                    $object->setParentId(4);
                    $object->setPublished(true);

                //     $category = new \Pimcore\Model\DataObject\Category\Listing();
                //     $category->setCondition('name = ?', $prod->category);
                //     $category->setLimit(1);
                //     foreach ($category as $cat) {
                        
                //     $object->setCategory($cat);
                // }

                    //$object->setSku($prod->sku);

                    $unit = DataObject\QuantityValue\Unit::getByAbbreviation('Rs');
                    $object->setPrice(new DataObject\Data\QuantityValue($prod->price, $unit->getId()));
                    $object->setName($prod->name);
                    $t = new \Pimcore\Model\DataObject\Data\RgbaColor();
                    $t->setRgba($prod->colour);
                    //$object->setPrice($prod->price);  
                    $object->setModelNo($prod->modelNo);
                    $object->setDescription($prod->description);
                    $object->setQuantityInStock($prod->quantityInStock);
                    $unit = DataObject\QuantityValue\Unit::getByAbbreviation('Kg');
                    $object->setWeight(new DataObject\Data\QuantityValue($prod->weight, $unit->getId()));
                    $unit = DataObject\QuantityValue\Unit::getByAbbreviation('V');
                    $object->setVoltage(new DataObject\Data\QuantityValue($prod->voltage, $unit->getId()));
                    $unit = DataObject\QuantityValue\Unit::getByAbbreviation('W');
                    $object->setWattage(new DataObject\Data\QuantityValue($prod->wattage, $unit->getId()));

                    $image = \Pimcore\Model\Asset\Image::getByPath($prod->image);
                    $object->setImage($image);

                   
                    
                    
                   
                    
                    
                   
                    

                    if($object->getName() == 'AcFeatures'){
                    $extraFeatures = new Dataobject\Objectbrick\Data\AcFeatures($object);
                    $object->getSpecificFeatures()->setAcFeatures($extraFeatures);
                    $extraFeatures->setInstallationType($prod->installationType);
                    $extraFeatures->setCapacity(new DataObject\Data\QuantityValue($prod->capacity, $unit->getId()));
                    $unit = DataObject\QuantityValue\Unit::getByAbbreviation('ton');
                    }

                    if($object->getName() == 'FanFeatures'){
                        $extraFeatures = new Dataobject\Objectbrick\Data\FanFeatures($object);
                        $object->getSpecificFeatures()->setFanFeatures($extraFeatures);
                        $extraFeatures->setblades($prod->blades);
                        $units = DataObject\QuantityValue\Unit::getByAbbreviation('Rpm');
                        $extraFeatures->setSpeed(new DataObject\Data\QuantityValue($prod->speed, $units->getId()));
                    
                    }

                    $t = new \Pimcore\Model\DataObject\Data\RgbaColor();
                    $t->setRgba($prod->colour);
                    $object->setColour($t);
    
    

                    $object->setRatings($prod->ratings);
                    $object->setBrand($prod->brand);
                    $launchDate = \Carbon\Carbon::parse($prod->launchDate);
                    $object->setLaunchDate($launchDate);

                    $category = new \Pimcore\Model\DataObject\Category\Listing();
                        $category->setCondition('name = ?', $prod->category);
                        $category->setLimit(1);
                        foreach ($category as $cat) {
                            //p_r($cat2);die;
                            $object->setCategory($cat);
                        }
                    $object->save();

                    if(($prod->key)==NULL || ($prod->name)==NULL)
                    {
                     $msg ="key or Name is given NULL.\n";
                    }
                    else
                   
                    $msg ="Data Imported Successfully.\n";
                    $count++;
                    $logMsg=new \Pimcore\Model\DataObject\Log();        
                    $logMsg->setKey("$prod->key");
                    $logMsg->setPublished(true);
                    $logMsg->setParentId(30);
                    $logMsg->setMessage($msg);
                    $logMsg->save();

                    $log=new \Pimcore\Model\DataObject\Import\Listing();
                    foreach($log as $prod)
                    {                    
                     //   $prod->setLog($msg);
                        $prod->setStatus(true);
                        $prod->save();
                    }

                    $msg = "Data Imported Successfully.\n";

                    // $mail = new \Pimcore\Mail();
                    // $mail->addTo('vashusharma1104@gmail.com');
                    // $mail->setSubject('New Arrival');
                    // $mail->setDocument('/importEmail');
                    // // $mail->setParams($params);
                    // $mail->send();


                   
                 
                }


                $this->dump('Data Imported Successfully');
            }
        }
    }