<?php
    namespace AppBundle\EventListener;
    
    use Pimcore\Event\Model\DataObjectEvent;
    use Pimcore\Model\DataObject\Product;
    use Pimcore\Model\Element\ValidationException;

    class DateListener {

        /**
        * @param DataObjectEvent $e 
        */
     
        
    

        public function DateException (DataObjectEvent $e) {
       
      
            if ($e->getObject() instanceof Product) {
                $prod = $e->getObject();
                if($prod->getLaunchDate() <  date("Y-m-d") ) {
                    throw new \Pimcore\Model\Element\ValidationException("Product has been expired");
                    
                    
                    
                }
            }
        }
    }
