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



class CategoryCommand extends AbstractCommand
{
    protected function configure()
    {
        $this
            ->setName('Pimcore:CsvCommand:Category')
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
        $object->setCondition('name = ?', 'Category');
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
                   
                    $object = new Pimcore\Model\DataObject\Category();
                    $object->setKey($prod->key);
                    $object->setParentId(3);
                    $object->setPublished(true);

                //     $category = new \Pimcore\Model\DataObject\Category\Listing();
                //     $category->setCondition('name = ?', $prod->category);
                //     $category->setLimit(1);
                //     foreach ($category as $cat) {
                        
                //     $object->setCategory($cat);
                // }

                    //$object->setSku($prod->sku);

                    
                    $object->setName($prod->name);

                    

                    //$object->setPrice($prod->price);  
                   
                    $object->setDescription($prod->description);
                    

                    $image = \Pimcore\Model\Asset\Image::getByPath($prod->image);
                    $object->setImage($image);

                   $object->setActive($prod->active);
                    
                    
                   
                    
                    
                   
                    

                    
                        
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
                    $logMsg->setParentId(16);
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
                   
                 
                }


                $this->dump('Data Imported Successfully');
            }
        }
    }