<?php

namespace AppBundle\Controller;

use Pimcore\Bundle\AdminBundle\Controller\Rest\AbstractRestController;
use Pimcore\Bundle\AdminBundle\HttpFoundation\JsonResponse;
use Pimcore\Bundle\AdminBundle\Security\BruteforceProtectionHandler;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Pimcore\Model\DataObject\Product;
use Pimcore\Model\DataObject\Category;
use Pimcore\Model\Asset\MetaData\ClassDefinition\Data\Asset;
use Pimcore\Model\DataObject\Brand;
use Pimcore\Model\DataObject\Objectbrick\Data\AcFeatures;
use Pimcore\Model\DataObject\Product\SpecificFeatures;

/**
 * Class RestController
 * @package AppBundle\Controller
 */

 class RestController extends AbstractRestController
 {
     CONST BASE_API_SERVICE = 'base_api_service';

     /**
      * @Route("/webservice/showProducts")
      * @Method({"GET"})
      * @param Request $request
      * @return \Symfony\Component\HttpFoundation\JsonResponse
      * @throws \Pimcore\Http\Exception\ResponseException
      * @throws \Exception
      */
    public function getProductList(Request $request, BruteforceProtectionHandler $bruteforceProtectionHandler)
    {
        $data = [];
        $product = new \Pimcore\Model\DataObject\Product\Listing();
                
        $product->getObjects();
        foreach ($product as $pro)
        {
          // echo(($pro->getCategory()->getName()));
          //  echo  ($pro->getName());
          //  echo "/n";
            $data[] = $this->getProduct($pro);
            
        }
        
        if (!empty($data)) {
            return $this->createSuccessResponse($data, true);
        }
        return $this->createErrorResponse("No product found!", Response::HTTP_NOT_FOUND);
     
       
       
    }
    
    
    /**
      * @Route("/webservice/filterProduct")
      * @Method({"GET"})
      * @param Request $request
      * @return \Symfony\Component\HttpFoundation\JsonResponse
      * @throws \Pimcore\Http\Exception\ResponseException
      * @throws \Exception
      */
    public function getProductfilter(Request $request, BruteforceProtectionHandler $bruteforceProtectionHandler)
    {   
        $brand = $request->query->get('brand');
        $lowerprice = $request->query->get('lowerprice');
        $data = [];
        $product = new \Pimcore\Model\DataObject\Product\Listing();
        $product->getObjects();
        foreach ($product as $pro)
       {
        
        if($brand) {
                   if($lowerprice) {
                    if((strcasecmp($brand , $pro->getBrand()) == 0) && abs(preg_filter('/[,Rs]+/', '', $lowerprice)) < abs(preg_filter('/[,Rs]+/','',($pro->getPrice()->__toString()))) ) 
                                   {
                                    $data[] = $this->getProduct($pro);
                                   }
                               }
                   
                  
                  
                   else {
                           if(strcasecmp($brand, $pro->getBrand()) == 0 )
                             {
                               $data[] = $this->getProduct($pro);
                             }

                       }
                  }
              
              
         elseif($lowerprice) {
          if( abs(preg_filter('/[,Rs]+/', '', $lowerprice)) < abs(preg_filter('/[,Rs]+/','',($pro->getPrice()->__toString()))))
                            {
                                $data[] = $this->getProduct($pro);
                            }

                        }
          else {
                $data[] = $this->getProduct($pro);
               }
            
          } 
          if (!empty($data)) 
          {
            return $this->createSuccessResponse($data, true);
          }
          return $this->createErrorResponse("No product found with given filter(s)!", Response::HTTP_NOT_FOUND);  
                
        
        
     
      
      }
      function getProduct(Product $pro)
      {  
          
       if(($pro->getCategory()->getName())== "AC")
       {
           
      
      return [
      
               'Brand'        => $pro->getBrand(), 
               'productName'  => $pro->getName(),
               'Model_Number' => $pro->getModelNo(),
               'price'        => $pro->getPrice()->__toString(),
               'category'     => $pro->getCategory()->getName(),
               'Qunatity'     => $pro->getQuantityInStock(),
               'color'        => $pro->getColour()->getHex(),
               'weight'       => $pro->getWeight()->__toString(),
               'image'        => $pro->getImage()->getRelativeFileSystemPath(),
               'ratings'      => $pro->getRatings(),
               'voltage'      => $pro->getVoltage()->__toString(),
               'wattage'      => $pro->getWattage()->__toString(),
               'capacity'     => $pro->getSpecificFeatures()->getAcFeatures()->getCapacity()->__toString(),
               'installation_type'     => $pro->getSpecificFeatures()->getAcFeatures()->getInstallationType(),
               'launch_Date'  => $pro->getLaunchDate()->toDateString(),
      
      ];
      }
      
      elseif(($pro->getCategory()->getName())== "geyser")
      {
      return [
      
               'Brand'        => $pro->getBrand(), 
               'productName'  => $pro->getName(),
               'Model_Number' => $pro->getModelNo(),
               'price'        => $pro->getPrice()->__toString(),
               'category'     => $pro->getCategory()->getName(),
               'Qunatity'     => $pro->getQuantityInStock(),
               'color'        => $pro->getColour()->getHex(),
               'weight'       => $pro->getWeight()->__toString(),
               'image'        => $pro->getImage()->getRelativeFileSystemPath(),
               'ratings'      => $pro->getRatings(),
               'voltage'      => $pro->getVoltage()->__toString(),
               'wattage'      => $pro->getWattage()->__toString(),
               'capacity'     => $pro->getSpecificFeatures()->getGeyserFeatures()->getCapacity()->__toString(),
            
               'launch_Date'  => $pro->getLaunchDate()->toDateString(),
             ];
      
      }
       
       
       
       
      elseif(($pro->getCategory()->getName())== "Fan")
      {
      return [
      
               'Brand'        => $pro->getBrand(), 
               'productName'  => $pro->getName(),
               'Model_Number' => $pro->getModelNo(),
               'price'        => $pro->getPrice()->__toString(),
               'category'     => $pro->getCategory()->getName(),
               'Qunatity'     => $pro->getQuantityInStock(),
               'color'        => $pro->getColour()->getHex(),
               'weight'       => $pro->getWeight()->__toString(),
               'image'        => $pro->getImage()->getRelativeFileSystemPath(),
               'ratings'      => $pro->getRatings(),
               'voltage'      => $pro->getVoltage()->__toString(),
               'wattage'      => $pro->getWattage()->__toString(),
               'capacity'     => $pro->getSpecificFeatures()->getFanFeatures()->getSpeed()->__toString(),
               'installation_type'     => $pro->getSpecificFeatures()->getFanFeatures()->getBlades(),
               'launch_Date'  => $pro->getLaunchDate()->toDateString(),
             ];
      
      }
      
      
      
      
      else
      {
       return [
      
               'Brand'        => $pro->getBrand(), 
               'productName'  => $pro->getName(),
               'Model_Number' => $pro->getModelNo(),
               'price'        => $pro->getPrice()->__toString(),
               'category'     => $pro->getCategory()->getName(),
               'Qunatity'     => $pro->getQuantityInStock(),
               'color'        => $pro->getColour()->getHex(),
               'weight'       => $pro->getWeight()->__toString(),
               'image'        => $pro->getImage()->getRelativeFileSystemPath(),
               'ratings'      => $pro->getRatings(),
               'voltage'      => $pro->getVoltage()->__toString(),
               'wattage'      => $pro->getWattage()->__toString(),
               'capacity'     => $pro->getSpecificFeatures()->getRefrigeratorFeatures()->getCapacity()->__toString(),
               'installation_type'     => $pro->getSpecificFeatures()->getRefrigeratorFeatures()->getDoorStyle(),
               'launch_Date'  => $pro->getLaunchDate()->toDateString(),
             ];
      
      }
      
      
     }
     
    
    }
    
?>  

